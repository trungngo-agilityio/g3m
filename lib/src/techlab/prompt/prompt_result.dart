part of g3.techlab;

class PromptResult extends SingleChildNode {
  final Map<String, dynamic> args;

  PromptResult(Map<String, dynamic> args, Node child)
      : args = Map.from(args),
        super(child);

  static PromptResult of(BuildContext context) {
    return context.findAncestorNodeOfExactType<PromptResult>();
  }

  dynamic value(String name) {
    return args[name];
  }

  @override
  Node build(BuildContext context) {
    final parent = context.findAncestorNodeOfExactType<PromptResult>();
    if (parent != null) {
      // merge the parent args.
      args.addAll(parent.args);
    }

    return super.build(context);
  }
}
