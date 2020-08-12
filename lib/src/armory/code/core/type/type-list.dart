part of g3.armory;

class CodeTypeListConfig extends CodeConfigNode<CodeTypeList> {
  CodeTypeListConfig(NodeBuildFunc<CodeTypeList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeTypeListConfig.commaSeparated(Node child) =>
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

  CodeTypeList(this.functions);
}
