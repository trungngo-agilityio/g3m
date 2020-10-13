part of g3.techlab;

class CodeCharLiteralConfig extends CodeConfigNode<CodeCharLiteral> {
  CodeCharLiteralConfig(NodeBuildFunc<CodeCharLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeCharLiteralConfig.forJavaLike(
    Node child, {
    String quoteChar = '\'',
  }) =>
      CodeCharLiteralConfig((context, literal) {
        if (literal.value == null) return CodeNullLiteral();

        return Pad.of(quoteChar, quoteChar, Text(literal.value));
      }, child);
}

class CodeCharLiteral extends CodeConfigProxyNode<CodeCharLiteral> {
  final String value;

  CodeCharLiteral._(this.value);

  factory CodeCharLiteral.of(String value) => CodeCharLiteral._(value);
}
