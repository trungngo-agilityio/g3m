part of g3.techlab.markdown;

class MarkdownFile implements Node {
  final String name;

  final MarkdownDoc source;

  /// True indicates that the file need to be overwrite all the time.
  /// False indicates that the file never get overwrite.
  /// null indicates that needs human confirm.
  final bool overwriteIfExists;

  MarkdownFile(this.name, {this.source, this.overwriteIfExists});

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: 'md',
      syntax: 'markdown',
      source: source,
      overwriteIfExists: overwriteIfExists,
    );
  }
}

class MarkdownDoc implements Node {
  final dynamic title;
  final List<MarkdownParagraph> paragraphs;
  final List<MarkdownSection> sections;
  final Node freeText;

  MarkdownDoc({
    @required this.title,
    @required this.paragraphs,
    this.sections,
    this.freeText,
  });

  @override
  Node build(BuildContext context) {
    return MarkdownCodeConfig(
      Container([
        MarkdownSection(
          title: title,
          paragraphs: paragraphs,
          sections: sections,
          freeText: freeText,
        ),
      ]),
    );
  }
}

class MarkdownCodeConfig extends ExactlyOneNode<MarkdownCodeConfig> {
  CodeConfigBuildFunc<IndentConfig> indentConfig;

  MarkdownCodeConfig(Node child, {this.indentConfig}) : super(child) {
    indentConfig = (_, sub) => IndentConfig.useSpace4(sub);
  }

  @override
  Node buildOne(BuildContext context, Node child) {
    return indentConfig(context, child);
  }
}

class MarkdownSection implements Node {
  final dynamic title;
  final List<MarkdownParagraph> paragraphs;
  final List<MarkdownSection> sections;
  final Node freeText;

  int level;

  MarkdownSection({
    @required this.title,
    @required this.paragraphs,
    this.sections,
    this.freeText,
  })  : assert(title != null),
        assert(paragraphs != null);

  @override
  Node build(BuildContext context) {
    // Builds the section level.
    final parent = context.findAncestorNodeOfExactType<MarkdownSection>();

    // Maximum accept 6 level.
    level = min(6, 1 + (parent?.level ?? 0));

    return Container([
      '\n',
      '#' * (level),
      ' ',
      title,
      '\n',
      '\n',
      Join.notSeparated(paragraphs),
      Container(sections),
      freeText,
    ]);
  }
}

class MarkdownParagraph implements Node {
  final List<dynamic> lines;

  MarkdownParagraph(this.lines);

  @override
  Node build(BuildContext context) {
    if (lines?.isNotEmpty == true) {
      return Container([
        Join.newLineSeparated(
          lines?.map((e) => e is Node ? e : Text.of(e))?.toList(),
        ),
        '\n',
        '\n',
      ]);
    }

    return null;
  }
}

class MarkdownBold implements Node {
  final dynamic text;

  MarkdownBold(this.text);

  @override
  Node build(BuildContext context) {
    return TextTransform(Text.of(text), StringFuncs.markdown.bold);
  }
}

class MarkdownItalic implements Node {
  final dynamic text;

  MarkdownItalic(this.text);

  @override
  Node build(BuildContext context) {
    return TextTransform(Text.of(text), StringFuncs.markdown.italic);
  }
}

class MarkdownCode implements Node {
  final dynamic text;

  MarkdownCode(this.text);

  @override
  Node build(BuildContext context) {
    return TextTransform(Text.of(text), StringFuncs.markdown.code);
  }
}

StringFunc _indent2Space =
    (s) => s?.isNotEmpty == true ? Indent.compute(s, false, 2, 1) : s;

class MarkdownList implements Node {
  final List<MarkdownListItem> items;

  int level;

  MarkdownList(
    this.items,
  );

  @override
  Node build(BuildContext context) {
    if (items?.isNotEmpty == true) {
      final parent = context.findAncestorNodeOfExactType<MarkdownList>();
      final res = Container(items);

      // For the first level markdown list, don't need to shift 2 spaces.
      return parent == null
          ? res
          : TextTransform(Container(items), _indent2Space);
    }

    return null;
  }
}

class MarkdownListItem implements Node {
  final MarkdownParagraph body;
  final List<MarkdownList> lists;

  int level;

  MarkdownListItem({this.body, this.lists});

  @override
  Node build(BuildContext context) {
    // For the first line, need to replace the 2 spaces indentation
    // to the `* ` start. For the rest, make 2 spaces indentation.
    return Container([
      '\n',
      Pad.left(
        '* ',
        Trim.left(TextTransform(body, _indent2Space)),
      ),
      '\n',
      lists?.isNotEmpty == true
          ? Pad.left('\n  ', TextTransform(Container(lists), _indent2Space))
          : null,
    ]);
  }
}
