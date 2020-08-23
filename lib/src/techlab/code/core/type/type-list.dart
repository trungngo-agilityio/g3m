part of g3.techlab;

class CodeTypeListConfig extends CodeConfigNode<CodeTypeList> {
  CodeTypeListConfig(NodeBuildFunc<CodeTypeList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeTypeListConfig.forJavaLike(Node child) =>
      CodeTypeListConfig((context, param) {
        final children = param.functions;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Join.commaSeparated(children);
      }, child);
}

class CodeTypeList extends CodeConfigProxyNode<CodeTypeList> {
  final List<CodeType> functions;

  CodeTypeList._(this.functions);

  factory CodeTypeList.of(List<CodeType> functions) =>
      functions?.isNotEmpty == true ? CodeTypeList._(functions) : null;
}
