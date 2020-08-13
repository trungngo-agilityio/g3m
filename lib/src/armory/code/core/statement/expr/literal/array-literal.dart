part of g3.armory;

class CodeArrayLiteralConfig extends CodeConfigNode<CodeArrayLiteral> {
  CodeArrayLiteralConfig(NodeBuildFunc<CodeArrayLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArrayLiteralConfig.forJavaLike(
    Node child, {
    String openBracket = '[',
    String closeBracket = ']',
  }) =>
      CodeArrayLiteralConfig((context, literal) {
        if (literal.values == null) return CodeNullLiteral();
        return Container([
          openBracket,
          literal.values.isNotEmpty
              ? Container([
                  ' ',
                  Join.commaSeparated(literal.values),
                  ' ',
                ])
              : null,
          closeBracket,
        ]);
      }, child);
}

class CodeArrayLiteral extends CodeConfigProxyNode<CodeArrayLiteral>
    implements CodeExpr {
  final List<CodeExpr> values;

  CodeArrayLiteral._(this.values);

  factory CodeArrayLiteral.of(List<dynamic> values) {
    return CodeArrayLiteral._(values?.map((e) => CodeExpr.of(e))?.toList());
  }
}
