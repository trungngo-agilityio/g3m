part of g3.armory;

class CodeStringLiteralConfig extends CodeConfigNode<CodeStringLiteral> {
  CodeStringLiteralConfig(
      NodeBuildFunc<CodeStringLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeStringLiteralConfig.forJavaLike(
    Node child, {
    String quoteString = '"',
  }) =>
      CodeStringLiteralConfig((context, literal) {
        if (literal.value == null) return CodeNullLiteral();

        return Pad.of(quoteString, quoteString, literal.value);
      }, child);
}

class CodeStringLiteral extends CodeConfigProxyNode<CodeStringLiteral>
    implements CodeExpr {
  final Node value;

  CodeStringLiteral._(this.value);

  factory CodeStringLiteral.of(dynamic value) =>
      CodeStringLiteral._(Text.of(value));
}
