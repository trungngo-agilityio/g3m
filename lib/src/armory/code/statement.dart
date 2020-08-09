part of g3.armory;

class CodeStatementConfig extends CodeConfigNode<CodeStatement> {
  CodeStatementConfig(NodeBuildFunc<CodeStatement> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeStatementConfig.endWithCommaAndNewLine(Node child) =>
      CodeStatementConfig((context, statement) {
        return Container([statement.expression, Text(';'), NewLine()]);
      }, child);

  factory CodeStatementConfig.endWithNewLine(Node child) =>
      CodeStatementConfig((context, statement) {
        return Container([statement.expression, NewLine()]);
      }, child);
}

class CodeStatement extends CodeConfigProxyNode<CodeStatement> {
  final Node expression;

  CodeStatement(this.expression);
}
