part of g3.armory;

class PromptInt extends PromptNode<int> {
  final String message;

  PromptInt(String name, {this.message, int init, Node child})
      : super(name, child: child, init: init);

  @override
  int _prompt(BuildContext context) {
    return prompts.getInt(message, defaultsTo: init);
  }
}
