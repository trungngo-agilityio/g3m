part of g3.techlab;

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
