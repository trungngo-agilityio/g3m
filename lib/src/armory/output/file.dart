part of g3.armory;

class File implements Node, Renderer, PostRenderer {
  final String name;

  final Node content;

  File(this.name, this.content);

  String _path;
  io.IOSink _out;

  @override
  Node build(BuildContext context) {
    return content;
  }

  @override
  void render(RenderContext context) {
    _path = ioPath.join(context.path, name);
    context.blockLevel = 0;

    // Redirect all children's output to the new file.
    _out = io.File(_path).openWrite();
    context.out = _out;
  }

  @override
  void postRender(RenderContext context) async {
    await _out.flush();
    await _out.close();
  }
}
