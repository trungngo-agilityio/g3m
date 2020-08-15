part of g3.armory;

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
    return TextTransform(content, StringFuncs.upper);
  }
}

class LowerCase implements Node {
  final Node content;

  LowerCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.lower);
  }
}

class PascalCase implements Node {
  final Node content;

  PascalCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.pascal);
  }
}

class CamelCase implements Node {
  final Node content;

  CamelCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.camel);
  }
}

class SnakeCase implements Node {
  final Node content;

  SnakeCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.snake);
  }
}

class PathCase implements Node {
  final Node content;

  PathCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.path);
  }
}

class DotCase implements Node {
  final Node content;

  DotCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.dot);
  }
}

class ParamCase implements Node {
  final Node content;

  ParamCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.param);
  }
}

class HeaderCase implements Node {
  final Node content;

  HeaderCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.header);
  }
}

class TitleCase implements Node {
  final Node content;

  TitleCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.title);
  }
}

class ConstantCase implements Node {
  final Node content;

  ConstantCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.constant);
  }
}

class SentenceCase implements Node {
  final Node content;

  SentenceCase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, StringFuncs.sentence);
  }
}
