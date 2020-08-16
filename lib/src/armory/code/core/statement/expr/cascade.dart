part of g3.armory;

class CodeCascadeConfig extends CodeConfigNode<CodeCascade> {
  CodeCascadeConfig(NodeBuildFunc<CodeCascade> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeCascadeConfig.noSupport(Node child) => CodeCascadeConfig(
      (context, expr) => throw ('cascade ".." operator is not available'),
      child);

  factory CodeCascadeConfig.forDartLike(
    Node child, {
    String cascadeKeyword = '..',
  }) =>
      CodeCascadeConfig((context, expr) {
        return Container([
          cascadeKeyword,
          expr.expr,
        ]);
      }, child);
}

class CodeCascade extends CodeConfigProxyNode<CodeCascade> {
  final CodeExpr expr;

  CodeCascade._(this.expr);

  factory CodeCascade.of(dynamic expr) => CodeCascade._(CodeExpr.of(expr));
}
