part of g3.armory;

class CodeYieldConfig extends CodeConfigNode<CodeYield> {
  CodeYieldConfig(NodeBuildFunc<CodeYield> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeYieldConfig.noSupport(Node child) => CodeYieldConfig(
      (context, expr) => throw ('"yield" expression is not available'), child);

  factory CodeYieldConfig.forDartLike(Node child) =>
      CodeYieldConfig((context, expr) {
        return Container([
          expr.comment,
          expr.async == true ? 'yield* ' : 'yield ',
          expr.expr,
        ]);
      }, child);
}

class CodeYield extends CodeConfigProxyNode<CodeYield> {
  final CodeExpr expr;
  final bool async;
  final CodeComment comment;

  CodeYield({
    this.expr,
    this.async,
    this.comment,
  });

  factory CodeYield.of(
    dynamic expr, {
    bool async,
    String comment,
  }) =>
      CodeYield(
        expr: CodeExpr.of(expr),
        async: async,
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
