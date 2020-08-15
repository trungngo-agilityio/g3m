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

  CodeGenericParamList._(this.params);

  factory CodeGenericParamList.single(String type) =>
      CodeGenericParamList._([CodeGenericParam.of(type)]);

  factory CodeGenericParamList.list(List<String> types) =>
      CodeGenericParamList._(
          types?.map((type) => CodeGenericParam.of(type))?.toList());

  factory CodeGenericParamList.of(List<CodeGenericParam> params) =>
      params?.isNotEmpty == true ? CodeGenericParamList._(params) : null;
}
