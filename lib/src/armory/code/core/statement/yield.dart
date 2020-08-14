part of g3.armory;

class CodeYieldConfig extends CodeConfigNode<CodeYield> {
  CodeYieldConfig(NodeBuildFunc<CodeYield> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeYieldConfig.forJavaLike(
    Node child, {
    String returnKeyword = 'yield ',
  }) =>
      CodeYieldConfig((context, expr) {
        return Container([
          expr.comment,
          returnKeyword,
          expr.expr,
        ]);
      }, child);
}

class CodeYield extends CodeConfigProxyNode<CodeYield> {
  final CodeExpr expr;
  final CodeComment comment;

  CodeYield({
    this.expr,
    this.comment,
  });

  factory CodeYield.of(
    dynamic expr, {
    String comment,
  }) =>
      CodeYield(
        expr: CodeExpr.of(expr),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
