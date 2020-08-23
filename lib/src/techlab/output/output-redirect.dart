part of g3.techlab;

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
