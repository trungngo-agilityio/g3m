part of g3.armory;

class CodeInterfaceListConfig extends CodeConfigNode<CodeInterfaceList> {
  CodeInterfaceListConfig(
      NodeBuildFunc<CodeInterfaceList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeInterfaceListConfig.newLineSeparated(Node child) =>
      CodeInterfaceListConfig((context, param) {
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

class CodeInterfaceList extends CodeConfigProxyNode<CodeInterfaceList> {
  final List<CodeInterface> functions;

  CodeInterfaceList(this.functions);
}
