part of g3.armory;

class CodeStatementListConfig extends CodeConfigNode<CodeStatementList> {
  CodeStatementListConfig(
      NodeBuildFunc<CodeStatementList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeStatementListConfig.asIs(Node child) =>
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

  factory CodeStatementList.of(List<CodeStatement> statements) =>
      statements?.isNotEmpty == true ? CodeStatementList._(statements) : null;

  factory CodeStatementList.single(String line) =>
      CodeStatementList._([CodeStatement.of(line)]);

  factory CodeStatementList.list(List<String> lines) => CodeStatementList.of(
      lines?.map((type) => CodeStatement.of(type))?.toList());
}
