part of g3.armory;

class CodeGenericParamListConfig extends CodeConfigNode<CodeGenericParamList> {
  CodeGenericParamListConfig(
      NodeBuildFunc<CodeGenericParamList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeGenericParamListConfig.forJavaLike(Node child) =>
      CodeGenericParamListConfig((context, param) {
        final params = param.params;
        if (params == null || params.isEmpty) {
          return null;
        }

        return Pad.angleBrackets(
          Join.commaSeparated(params),
          onlyIfMissing: true,
        );
      }, child);
}

class CodeGenericParamList extends CodeConfigProxyNode<CodeGenericParamList> {
  final List<CodeGenericParam> params;

  CodeGenericParamList(this.params);

  factory CodeGenericParamList.single(String type) =>
      CodeGenericParamList([CodeGenericParam.simple(type)]);

  factory CodeGenericParamList.list(List<String> types) => CodeGenericParamList(
      types?.map((type) => CodeGenericParam.simple(type))?.toList());
}
