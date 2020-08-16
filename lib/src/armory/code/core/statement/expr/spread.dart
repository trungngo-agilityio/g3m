part of g3.armory;

class CodeSpreadConfig extends CodeConfigNode<CodeSpread> {
  CodeSpreadConfig(NodeBuildFunc<CodeSpread> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeSpreadConfig.noSupport(Node child) => CodeSpreadConfig(
      (context, expr) => throw ('spread "..." operator is not available'),
      child);

  factory CodeSpreadConfig.forDartLike(
    Node child, {
    String spreadKeyword = '...',
  }) =>
      CodeSpreadConfig((context, expr) {
        return Container([
          spreadKeyword,
          expr.expr,
        ]);
      }, child);
}

class CodeSpread extends CodeConfigProxyNode<CodeSpread> {
  final CodeExpr expr;

  CodeSpread._(this.expr);

  factory CodeSpread.of(dynamic expr) => CodeSpread._(CodeExpr.of(expr));
}
