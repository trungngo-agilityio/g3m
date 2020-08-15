part of g3.armory;

class PromptChooseUtil extends PromptChoose implements LoopNode {
  final String doneOption;
  final Function(BuildContext context) onContinue;
  final Function(BuildContext context) onDone;

  bool _isDone;

  PromptChooseUtil(
    String name, {
    String message,
    Map<String, String> options,
    String init,
    this.doneOption,
    this.onContinue,
    this.onDone,
  }) : super(
          name,
          message: message,
          options: options,
          child: null,
          init: init,
        );

  @override
  Node build(BuildContext context) {
    final value = _prompt(context);

    _isDone = doneOption == value ||
        doneOption == null && value == options.values.last;

    Node child;

    if (_isDone) {
      child = onDone != null ? NodeBuilder(onDone) : null;
    } else if (onContinue != null) {
      child = NodeBuilder(onContinue);
    }

    return child == null ? null : PromptResult({name: value}, child);
  }

  @override
  bool get isDone => _isDone;
}
