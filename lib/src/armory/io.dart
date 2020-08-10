part of g3.armory;

class Directory implements Node, Renderer {
  final String path;

  final Node child;

  Directory(this.path, this.child);

  static Directory of(BuildContext context) {
    return context.dependOnAncestorNodeOfExactType<Directory>();
  }

  factory Directory.temp(String path, Node child) {
    final tempDir = io.Directory.systemTemp.createTempSync(path).path;
    return Directory(tempDir, child);
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

  String _path;
  io.IOSink _out;

  @override
  Node build(BuildContext context) {
    final dir = Directory.of(context);
    _path = ioPath.join(dir.path, name);
    return content;
  }

  @override
  void render(RenderContext context) {
    print('open file ${_path}');
    context.blockLevel = 0;
    _out = io.File(_path).openWrite();
    context.out = _out;
  }

  @override
  void postRender(RenderContext context) async {
    print('close file ${_path}');
    await _out.flush();
    await _out.close();
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
