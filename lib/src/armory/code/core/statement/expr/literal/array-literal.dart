part of g3.armory;

class CodeArrayLiteralConfig extends CodeConfigNode<CodeArrayLiteral> {
  CodeArrayLiteralConfig(NodeBuildFunc<CodeArrayLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArrayLiteralConfig.of(
    Node child, {
    String openBracket = '[',
    String closeBracket = ']',
    String separator = ',\n',
    String prefix,
    bool indent,
  }) =>
      CodeArrayLiteralConfig((context, literal) {
        if (literal.values == null) return CodeNullLiteral();
        var body = Join.of(
            separator,
            literal.values
                ?.map(
                  (e) => Pad.left(prefix, e),
                )
                ?.toList());
        return Container([
          openBracket,
          literal.values.isNotEmpty
              ? indent == true ? Indent(body) : body
              : null,
          closeBracket,
        ]);
      }, child);

  factory CodeArrayLiteralConfig.forJsonLike(Node child) =>
      CodeArrayLiteralConfig.of(child,
          openBracket: '[\n',
          closeBracket: '\n]',
          separator: ',\n',
          indent: true);

  factory CodeArrayLiteralConfig.forYmlLike(Node child) =>
      CodeArrayLiteralConfig.of(
        child,
        openBracket: '',
        closeBracket: '\n',
        separator: '\n',
        prefix: '- ',
      );
}

class CodeArrayLiteral extends CodeConfigProxyNode<CodeArrayLiteral>
    implements CodeExpr {
  final List<CodeExpr> values;

  CodeArrayLiteral._(this.values);

  factory CodeArrayLiteral.of(List<dynamic> values) {
    return CodeArrayLiteral._(values?.map((e) => CodeExpr.of(e))?.toList());
  }
}
