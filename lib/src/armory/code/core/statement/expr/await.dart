part of g3.armory;

class CodeAwaitConfig extends CodeConfigNode<CodeAwait> {
  CodeAwaitConfig(NodeBuildFunc<CodeAwait> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAwaitConfig.forJavaLike(
    Node child, {
    String awaitKeyword = 'await ',
  }) =>
      CodeAwaitConfig((context, expr) {
        return Container([
          awaitKeyword,
          expr.expr,
        ]);
      }, child);
}

class CodeAwait extends CodeConfigProxyNode<CodeAwait> {
  final OldCodeExpr expr;

  CodeAwait(
    this.expr,
  );

  factory CodeAwait.of(dynamic expr) => CodeAwait(OldCodeExpr.of(expr));
}
