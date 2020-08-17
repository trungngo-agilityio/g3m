part of g3.armory;

class CodeArrayLiteralConfig extends CodeConfigNode<CodeArrayLiteral> {
  CodeArrayLiteralConfig(NodeBuildFunc<CodeArrayLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArrayLiteralConfig.forJavaLike(
    Node child, {
    String emptyArray = '[]',
    String openBracket = '[\n',
    String closeBracket = '\n]',
    String separator = ',\n',
    String prefix,
    bool indent = true,
  }) =>
      CodeArrayLiteralConfig((context, literal) {
        if (literal.values == null) return CodeNullLiteral();
        if (literal.values.isEmpty) {
          return Text.of(emptyArray);
        }

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

  factory CodeArrayLiteralConfig.forYmlLike(Node child) =>
      CodeArrayLiteralConfig.forJavaLike(
        child,
        emptyArray: '',
        openBracket: '',
        closeBracket: '\n',
        separator: '\n',
        prefix: '- ',
      );
}

class CodeArrayLiteral extends CodeConfigProxyNode<CodeArrayLiteral>
    implements OldCodeExpr {
  final List<OldCodeExpr> values;

  CodeArrayLiteral._(this.values);

  factory CodeArrayLiteral.of(List<dynamic> values) {
    return CodeArrayLiteral._(values?.map((e) => OldCodeExpr.of(e))?.toList());
  }
}
