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

  static CodeGenericParamList _parse(dynamic value,
      {_NodeParseErrorFunc error}) {
    return _parseNode<CodeGenericParamList>(value, (v) {
      final list = _parseNodeList<CodeGenericParam>(v, CodeGenericParam._parse);
      if (list != null) return CodeGenericParamList._(list);
      return null;
    }, error: error);
  }

  factory CodeGenericParamList.of(dynamic values) {
    return CodeGenericParamList._parse(values, error: () {
      throw '$values is not a valid generic param list';
    });
  }
}
