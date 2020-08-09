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

  CodeStatementList(this.statements);

  factory CodeStatementList.single(String line) =>
      CodeStatementList([CodeStatement.of(line)]);

  factory CodeStatementList.list(List<String> lines) =>
      CodeStatementList(lines?.map((type) => CodeStatement.of(type))?.toList());
}
