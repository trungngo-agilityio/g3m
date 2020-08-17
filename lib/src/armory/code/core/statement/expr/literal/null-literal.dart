part of g3.armory;

class CodeNullLiteralConfig extends CodeConfigNode<CodeNullLiteral> {
  CodeNullLiteralConfig(NodeBuildFunc<CodeNullLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeNullLiteralConfig.forJavaLike(
    Node child, {
    String nullKeyword = 'null',
  }) =>
      CodeNullLiteralConfig((context, package) {
        return Text.of(nullKeyword);
      }, child);
}

class CodeNullLiteral extends CodeConfigProxyNode<CodeNullLiteral>
    implements OldCodeExpr {}
