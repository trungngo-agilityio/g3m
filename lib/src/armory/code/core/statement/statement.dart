part of g3.armory;

abstract class _CodeStatementLike {}

class CodeStatementConfig extends CodeConfigNode<CodeStatement> {
  CodeStatementConfig(NodeBuildFunc<CodeStatement> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeStatementConfig.endWithCommaAndNewLine(Node child) =>
      CodeStatementConfig((context, statement) {
        final expr = statement.expr;
        if (expr is _CodeStatementLike) return expr;

        return TextTransform(statement.expr, (s) {
          s = s?.trim();
          if (s.isNotEmpty) return s + ';\n';
          return '\n';
        });
      }, child);

  factory CodeStatementConfig.endWithNewLine(Node child) =>
      CodeStatementConfig((context, statement) {
        return Container([statement.expr, NewLine()]);
      }, child);
}

class CodeStatement extends CodeConfigProxyNode<CodeStatement> {
  final CodeExpr expr;

  CodeStatement(this.expr);

  factory CodeStatement.of(dynamic text) {
    if (text == null) return null;
    if (text is CodeStatement) return text;

    // Treats the whole string is a free text expression.
    if (text is String) {
      return CodeStatement(_CodeFreeExpr.text(text?.trim()));
    }
    return CodeStatement(CodeExpr.of(text));
  }
}
