part of g3.techlab;

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
  final CodeExpr expr;

  CodeAwait._(this.expr);

  factory CodeAwait.of(dynamic expr) => CodeAwait._(CodeExpr.of(expr));
}
