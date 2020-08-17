part of g3.armory;

class CodeBreakConfig extends CodeConfigNode<CodeBreak> implements OldCodeExpr {
  CodeBreakConfig(NodeBuildFunc<CodeBreak> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeBreakConfig.forJavaLike(
    Node child, {
    String breakKeyword = 'break',
  }) =>
      CodeBreakConfig((context, package) {
        return CodeStatement.of(breakKeyword);
      }, child);
}

class CodeBreak extends CodeConfigProxyNode<CodeBreak> {}
