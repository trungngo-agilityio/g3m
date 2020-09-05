part of g3.techlab;

class PromptLoop implements LoopNode {
  bool _isDone;

  @override
  bool get isDone => _isDone;

  final String message;
  final bool init;
  final Function(BuildContext context) onContinue;
  final Function(BuildContext context) onDone;

  PromptLoop(this.message, {this.init, @required this.onContinue, this.onDone});

  @override
  Node build(BuildContext context) {
    if (_isDone == null) {
      _isDone = false;
    } else {
      _isDone = !prompts.getBool(message, defaultsTo: init);
    }

    if (_isDone) {
      if (onDone != null) {
        return onDone(context);
      } else {
        return null;
      }
    } else {
      if (onContinue != null) {
        final res = onContinue(context);
        if (res == null) _isDone = true;
        return res;
      } else {
        return null;
      }
    }
  }
}
