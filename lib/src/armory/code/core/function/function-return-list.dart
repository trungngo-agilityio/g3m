part of g3.armory;

class CodeFunctionReturnListConfig
    extends CodeConfigNode<CodeFunctionReturnList> {
  CodeFunctionReturnListConfig(
      NodeBuildFunc<CodeFunctionReturnList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionReturnListConfig.forJavaLike(Node child) =>
      CodeFunctionReturnListConfig((context, param) {
        final types = param.types;
        if (types == null || types.isEmpty) {
          return null;
        }

        return Join.commaSeparated(types);
      }, child);
}

class CodeFunctionReturnList
    extends CodeConfigProxyNode<CodeFunctionReturnList> {
  final List<CodeFunctionReturn> types;

  CodeFunctionReturnList(this.types);

  factory CodeFunctionReturnList.single(String type) =>
      CodeFunctionReturnList([CodeFunctionReturn.simple(type)]);

  factory CodeFunctionReturnList.list(List<String> types) =>
      CodeFunctionReturnList(
          types?.map((type) => CodeFunctionReturn.simple(type))?.toList());
}
