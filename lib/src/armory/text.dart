part of g3.armory;

/// The simple node that writes the specified [text] to the
/// ancestor's output sink.
///
class Text extends NoChildNode implements Renderer {
  final String text;

  Text(this.text);

  factory Text.space([count]) => Text(' ' * (count ?? 1));

  @override
  void render(RenderContext context) {
    if (text == null) return;
    // Writes out the text as is.
    context.out.write(text);
  }
}

/// The simple node that writes a new line character to the
/// ancestor's output sink.
///
class NewLine extends NoChildNode implements Renderer {
  @override
  void render(RenderContext context) {
    context.out.writeln();
  }
}

/// The general purpose node that transform all the output
/// produced by its child using the specified [transform] function.
///
/// Please checkout other commonly used case sensitive transform nodes: [UpperCase],
/// [LowerCase], [PascalCase], [CamelCase], [SnakeCase], [PathCase]
/// [DotCase], [ParamCase], [HeaderCase], [TitleCase], [ConstantCase],
/// [SentenceCase].
///
class TextTransform implements Node, Renderer, PostRenderer {
  final Node content;
  final StringFunc transform;

  TextTransform(this.content, this.transform);

  @override
  Node build(BuildContext context) {
    return content;
  }

  StringSink _old;
  StringBuffer _buffer;

  @override
  void render(RenderContext context) {
    _buffer = StringBuffer();
    _old = context.out;
    context.out = _buffer;
  }

  @override
  void postRender(RenderContext context) {
    var s = _buffer.toString();
    s = transform(s);
    context.out = _old;
    context.out.write(s);
  }
}

class UpperCase implements Node {
  final Node content;

  UpperCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, upper);
  }
}

class LowerCase implements Node {
  final Node content;

  LowerCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, lower);
  }
}

class PascalCase implements Node {
  final Node content;

  PascalCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, pascal);
  }
}

class CamelCase implements Node {
  final Node content;

  CamelCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, camel);
  }
}

class SnakeCase implements Node {
  final Node content;

  SnakeCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, snake);
  }
}

class PathCase implements Node {
  final Node content;

  PathCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, path);
  }
}

class DotCase implements Node {
  final Node content;

  DotCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, dot);
  }
}

class ParamCase implements Node {
  final Node content;

  ParamCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, param);
  }
}

class HeaderCase implements Node {
  final Node content;

  HeaderCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, header);
  }
}

class TitleCase implements Node {
  final Node content;

  TitleCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, title);
  }
}

class ConstantCase implements Node {
  final Node content;

  ConstantCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, constant);
  }
}

class SentenceCase implements Node {
  final Node content;

  SentenceCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, sentence);
  }
}

/// Defines indentation config for all descendents.
/// [Ident] can be used to indent child's output with this configuration.
///
class IndentationConfig implements Node {
  /// True indicates that the code should use tab character for indentation.
  /// Otherwise, space will be used.
  final bool useTab;

  /// How many characters (tab or space) shall be used for indentation.
  final int size;

  final Node child;

  IndentationConfig({
    this.size = 2,
    this.useTab = false,
    this.child,
  });

  IndentationConfig.useSpace2(Node child)
      : size = 2,
        useTab = false,
        child = child;

  IndentationConfig.useSpace4(Node child)
      : size = 4,
        useTab = false,
        child = child;

  IndentationConfig.useTab(Node child)
      : size = 1,
        useTab = true,
        child = child;

  @override
  Node build(BuildContext context) {
    return child;
  }

  static IndentationConfig of(BuildContext context) {
    return context.dependOnAncestorNodeOfExactType<IndentationConfig>();
  }
}

class Indent implements Node {
  final int level;
  final Node child;

  Indent(this.child, {this.level = 1});

  @override
  Node build(BuildContext context) {
    final config = IndentationConfig.of(context);
    var tab = config.useTab ? '\t' : ' ';
    tab *= config.size * level ?? 1;
    return TextTransform(child, (s) => tab + s.split('\n').join('\n${tab}'));
  }
}

class Bold implements Node {
  final Node content;

  Bold(this.content);

  @override
  Node build(BuildContext context) {
    return content;
  }
}

class Italic implements Node {
  final Node content;

  Italic(this.content);

  @override
  Node build(BuildContext context) {
    return content;
  }
}

class Trim implements Node {
  final bool left;
  final bool right;
  final Node content;

  Trim(this.left, this.right, this.content);

  factory Trim.left(Node content) => Trim(true, false, content);

  factory Trim.right(Node content) => Trim(false, true, content);

  factory Trim.leftRight(Node content) => Trim(true, true, content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, (s) {
      if (left == true && right == true) {
        return s.trim();
      } else if (left == true) {
        return s.trimLeft();
      } else {
        return s.trimRight();
      }
    });
  }
}

class Pad implements Node {
  final Node prefix;
  final Node suffix;
  final Node content;

  Pad(this.prefix, this.suffix, this.content);

  factory Pad.left(String prefix, Node content) =>
      Pad.of(prefix, null, content);

  factory Pad.right(String suffix, Node content) =>
      Pad.of(null, suffix, content);

  factory Pad.leftRight(String text, Node content) =>
      Pad.of(text, text, content);

  factory Pad.of(String prefix, String suffix, Node content) =>
      Pad(Text(prefix), Text(suffix), content);

  @override
  Node build(BuildContext context) {
    return Container([
      prefix,
      content,
      suffix,
    ]);
  }
}

class Join implements Node {
  final Node separator;
  final List<Node> children;

  Join(this.separator, this.children);

  factory Join.commaSeparated(List<Node> children) => Join.of(', ', children);

  factory Join.spaceSeparated(List<Node> children) => Join.of(' ', children);

  factory Join.of(String separator, List<Node> children) =>
      Join(Text(separator), children);

  @override
  Node build(BuildContext context) {
    final res = <Node>[children[0]];
    for (var i = 1; i < children.length; i++) {
      res.add(separator);
      res.add(children[i]);
    }
    return Container(res);
  }
}
