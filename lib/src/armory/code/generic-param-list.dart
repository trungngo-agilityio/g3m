part of g3.armory;

class CodeGenericParamListConfig extends CodeConfigNode<CodeGenericParamList> {
  CodeGenericParamListConfig(
      NodeBuildFunc<CodeGenericParamList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeGenericParamListConfig.javaLike(Node child) =>
      CodeGenericParamListConfig((context, param) {
        final children = param.children;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Pad.of('<', '>', Join.commaSeparated(children));
      }, child);
}

class CodeGenericParamList extends CodeConfigProxyNode<CodeGenericParamList> {
  final List<CodeGenericParam> children;

  CodeGenericParamList(this.children);
}
