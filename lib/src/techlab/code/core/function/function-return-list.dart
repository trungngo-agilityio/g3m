part of g3.techlab;

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

  CodeFunctionReturnList._(this.types);

  static CodeFunctionReturnList _parse(dynamic value,
      {_NodeParseErrorFunc error}) {
    return _parseNode<CodeFunctionReturnList>(value, (v) {
      final list =
          _parseNodeList<CodeFunctionReturn>(v, CodeFunctionReturn._parse);
      if (list != null) return CodeFunctionReturnList._(list);
      return null;
    }, error: error);
  }

  factory CodeFunctionReturnList.of(dynamic values) {
    return CodeFunctionReturnList._parse(values, error: () {
      throw '$values is not a valid function return list';
    });
  }
}
