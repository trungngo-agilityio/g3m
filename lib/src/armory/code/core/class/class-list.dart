part of g3.armory;

class CodeClassListConfig extends CodeConfigNode<CodeClassList> {
  CodeClassListConfig(NodeBuildFunc<CodeClassList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassListConfig.newLineSeparated(Node child) =>
      CodeClassListConfig((context, param) {
        final children = param.functions;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container([
          NewLine(),
          NewLine(),
          Join.newLineSeparated(children),
        ]);
      }, child);
}

class CodeClassList extends CodeConfigProxyNode<CodeClassList> {
  final List<CodeClass> functions;

  CodeClassList(this.functions);
}
