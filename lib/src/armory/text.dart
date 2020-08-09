part of g3.armory;

class Text extends StatelessNode implements Renderer {
  final String text;

  Text(this.text);

  @override
  void render(RenderContext context) {
    context.out.write(text);
  }
}

class NewLine extends StatelessNode implements Renderer {
  @override
  void render(RenderContext context) {
    context.out.writeln();
  }
}

class TextTransform implements Node, Renderer, PostRenderer {
  final Node content;
  final String Function(String) transform;

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

class Uppercase implements Node {
  final Node content;

  Uppercase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, (s) => s.toUpperCase());
  }
}

class Lowercase implements Node {
  final Node content;

  Lowercase(this.content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, (s) => s.toLowerCase());
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
