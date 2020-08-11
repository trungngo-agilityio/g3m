part of g3.armory;

class CodeClassConstructorListConfig
    extends CodeConfigNode<CodeClassConstructorList> {
  CodeClassConstructorListConfig(
      NodeBuildFunc<CodeClassConstructorList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConstructorListConfig.newLineSeparated(Node child) =>
      CodeClassConstructorListConfig((context, param) {
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

class CodeClassConstructorList
    extends CodeConfigProxyNode<CodeClassConstructorList> {
  final List<CodeClassConstructor> functions;

  CodeClassConstructorList(this.functions);
}
