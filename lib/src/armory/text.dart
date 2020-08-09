part of g3.armory;

/// The simple node that writes the specified [text] to the
/// ancestor's output sink.
///
class Text extends NoChildNode implements Renderer {
  final String text;

  Text(this.text);

  @override
  void render(RenderContext context) {
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
    return context.dependOnInheritedWidgetOfExactType<IndentationConfig>();
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
