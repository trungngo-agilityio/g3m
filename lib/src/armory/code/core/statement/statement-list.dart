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

  factory CodeStatementList.of(List<dynamic> statements) {
    if (statements == null) return null;
    return CodeStatementList._(
        statements?.map((e) => CodeStatement.of(e))?.toList());
  }
}
