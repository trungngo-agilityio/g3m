part of g3.armory;

class CodeReturnConfig extends CodeConfigNode<CodeReturn> {
  CodeReturnConfig(NodeBuildFunc<CodeReturn> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeReturnConfig.forJavaLike(
    Node child, {
    String returnKeyword = 'return',
  }) =>
      CodeReturnConfig((context, expr) {
        return CodeExpr.open(
          Container([
            expr.comment,
            returnKeyword,
            ' ',
            expr.expr,
          ]),
        );
      }, child);
}

class CodeReturn extends CodeConfigProxyNode<CodeReturn> {
  final CodeExpr expr;
  final CodeComment comment;

  CodeReturn({
    this.expr,
    this.comment,
  });

  factory CodeReturn.of(
    dynamic expr, {
    String comment,
  }) =>
      CodeReturn(
        expr: CodeExpr.of(expr),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
