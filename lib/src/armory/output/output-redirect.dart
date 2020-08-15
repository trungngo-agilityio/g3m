part of g3.armory;

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

class Console implements Node {
  final Node child;
  final bool error;

  Console(this.child, this.error);

  factory Console.info(dynamic text) =>
      Console(text is Node ? text : Text.of(text?.toString()), false);

  factory Console.error(dynamic text) =>
      Console(text is Node ? text : Text.of(text?.toString()), true);

  @override
  Node build(BuildContext context) {
    return OutputRedirect(
        error == true ? io.stderr : io.stdout,
        Container([
          child,
          '\n',
        ]));
  }
}
