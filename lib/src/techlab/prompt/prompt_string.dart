part of g3.techlab;

class PromptString extends PromptNode<String> {
  final String message;

  PromptString(String name, {this.message, Node child})
      : super(name, child: child);

  @override
  String _prompt(BuildContext context) {
    return prompts.get(message, defaultsTo: init);
  }
}
