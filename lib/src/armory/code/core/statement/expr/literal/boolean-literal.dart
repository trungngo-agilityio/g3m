part of g3.armory;

class CodeBoolLiteralConfig extends CodeConfigNode<CodeBoolLiteral> {
  CodeBoolLiteralConfig(NodeBuildFunc<CodeBoolLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeBoolLiteralConfig.forJavaLike(
    Node child, {
    String trueKeyword = 'true',
    String falseKeyword = 'false',
  }) =>
      CodeBoolLiteralConfig((context, literal) {
        if (literal.value == null) return CodeNullLiteral();
        if (literal.value == true) return Text.of(trueKeyword);
        return Text.of(falseKeyword);
      }, child);
}

class CodeBoolLiteral extends CodeConfigProxyNode<CodeBoolLiteral>
    implements OldCodeExpr {
  final bool value;

  CodeBoolLiteral._(this.value);

  factory CodeBoolLiteral.of(bool value) => CodeBoolLiteral._(value);
}
