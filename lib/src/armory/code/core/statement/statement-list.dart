part of g3.armory;

class CodeStatementListConfig extends CodeConfigNode<CodeStatementList> {
  CodeStatementListConfig(
      NodeBuildFunc<CodeStatementList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeStatementListConfig.forJavaLike(Node child) =>
      CodeStatementListConfig((context, param) {
        final types = param.statements;
        if (types == null || types.isEmpty) {
          return null;
        }

        return Join.notSeparated(types);
      }, child);
}

class CodeStatementList extends CodeConfigProxyNode<CodeStatementList> {
  final List<CodeStatement> statements;

  CodeStatementList._(this.statements);

  factory CodeStatementList._parse(
    dynamic value, {
    _NodeParseErrorFunc error,
  }) {
    return _parseNode<CodeStatementList>(value, (v) {
      // Try to parse the body as the node list.
      final statements = _parseNodeList<CodeStatement>(v, (v) {
        return CodeStatement._parse(v);
      });

      if (statements != null) {
        // Found result.
        return CodeStatementList._(statements);
      }

      return null;
    }, error: error);
  }

  factory CodeStatementList.of(dynamic value) =>
      CodeStatementList._parse(value, error: () {
        throw 'cannot parse ${value} as statement list';
      });
}
