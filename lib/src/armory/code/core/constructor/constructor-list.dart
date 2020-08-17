part of g3.armory;

class CodeConstructorListConfig
    extends CodeConfigNode<CodeClassConstructorList> {
  CodeConstructorListConfig(
      NodeBuildFunc<CodeClassConstructorList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeConstructorListConfig.forJavaLike(Node child) =>
      CodeConstructorListConfig((context, param) {
        final children = param.functions;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container([
          '\n',
          Join.newLineSeparated(children),
        ]);
      }, child);
}

class CodeClassConstructorList
    extends CodeConfigProxyNode<CodeClassConstructorList> {
  final List<CodeConstructor> functions;

  CodeClassConstructorList(this.functions);
}
