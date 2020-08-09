part of g3.armory;

class Directory implements Node, Renderer {
  final String path;
  final Node child;

  Directory(this.path, this.child);

  static Directory of(BuildContext context) {
    return context.dependOnAncestorNodeOfExactType<Directory>();
  }

  @override
  Node build(BuildContext context) {
    return child;
  }

  @override
  void render(RenderContext context) {
    print('folder: ${path}');
    context.path = path;
  }
}

class File implements Node, Renderer, PostRenderer {
  final String name;

  final Node content;

  File(this.name, this.content);

  @override
  Node build(BuildContext context) {
    return content;
  }

  @override
  void render(RenderContext context) {
    context.blockLevel = 0;
    print('open file ${name}');
  }

  @override
  void postRender(RenderContext context) {
    print('close file ${name}');
  }
}

class OutputRedirect implements Node, Renderer {
  final StringSink out;
  final Node content;

  OutputRedirect(this.out, this.content);

  factory OutputRedirect.console(Node content) =>
      OutputRedirect(io.stdout, content);

  @override
  Node build(BuildContext context) {
    return content;
  }

  @override
  void render(RenderContext context) {
    context.out = out;
  }
}

class DotKeepFile implements Node {
  @override
  Node build(BuildContext context) {
    return File('.keep', null);
  }
}
