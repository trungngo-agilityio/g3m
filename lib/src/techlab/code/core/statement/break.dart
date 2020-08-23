part of g3.techlab;

class CodeBreakConfig extends CodeConfigNode<CodeBreak> {
  CodeBreakConfig(NodeBuildFunc<CodeBreak> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeBreakConfig.forJavaLike(
    Node child, {
    String breakKeyword = 'break',
  }) =>
      CodeBreakConfig((context, package) {
        return CodeExpr._(Text._(breakKeyword), false);
      }, child);
}

class CodeBreak extends CodeConfigProxyNode<CodeBreak> {}
