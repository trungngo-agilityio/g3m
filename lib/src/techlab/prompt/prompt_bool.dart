part of g3.techlab;

class PromptBool extends PromptNode<bool> {
  final String message;

  PromptBool(String name, {this.message, bool init, Node child})
      : super(name, child: child, init: init);

  @override
  bool _prompt(BuildContext context) {
    return prompts.getBool(message, defaultsTo: init);
  }
}
