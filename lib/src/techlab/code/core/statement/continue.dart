part of g3.techlab;

class CodeContinueConfig extends CodeConfigNode<CodeContinue> {
  CodeContinueConfig(NodeBuildFunc<CodeContinue> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeContinueConfig.forJavaLike(
    Node child, {
    String continueKeyword = 'continue',
  }) =>
      CodeContinueConfig((context, package) {
        return CodeExpr._(Text(continueKeyword), false);
      }, child);
}

class CodeContinue extends CodeConfigProxyNode<CodeContinue> {}
