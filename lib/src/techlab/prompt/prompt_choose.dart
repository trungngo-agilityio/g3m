part of g3.techlab;

class PromptChoose extends PromptNode<String> {
  final String message;
  final Map<String, String> options;

  PromptChoose(
    String name, {
    this.message,
    this.options,
    String init,
    Node child,
  }) : super(name, child: child, init: init);

  @override
  String _prompt(BuildContext context) {
    return prompts.choose(message, options.values,
        defaultsTo: init, names: options.keys);
  }
}
