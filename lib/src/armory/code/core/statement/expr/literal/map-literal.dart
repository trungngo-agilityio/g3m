part of g3.armory;

class CodeMapLiteralConfig extends CodeConfigNode<CodeMapLiteral> {
  CodeMapLiteralConfig(NodeBuildFunc<CodeMapLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeMapLiteralConfig.forJsonLike(
    Node child, {
    String openBracket = '{',
    String closeBracket = '}',
    String quote = '"',
    String separator = ': ',
  }) =>
      CodeMapLiteralConfig((context, literal) {
        if (literal.values == null) return CodeNullLiteral();
        var pairs = literal.values.entries.map(
          (e) {
            final k = Pad.of(quote, quote, Text.of(e.key));
            return Container([k, separator, e.value]);
          },
        ).toList();
        return Container([
          openBracket,
          literal.values.isNotEmpty
              ? Container([
                  '\n',
                  Indent(Join.of(',\n', pairs)),
                  '\n',
                ])
              : null,
          closeBracket,
        ]);
      }, child);

  factory CodeMapLiteralConfig.forYmlLike(
    Node child, {
    String separator = ': ',
  }) =>
      CodeMapLiteralConfig((context, literal) {
        final config = IndentConfig.of(context);

        if (literal.values == null) return CodeNullLiteral();
        var pairs = literal.values.entries.map(
          (e) {
            return Container([
              e.key,
              separator,
              TextTransform(e.value, (s) {
                if (s?.contains('\n') == true) {
                  return '\n' +
                      Indent.compute(s, config.useTab, config.size, 1);
                }
                return s;
              }),
            ]);
          },
        ).toList();

        return literal.values.isNotEmpty ? Join.of('\n', pairs) : null;
      }, child);
}

class CodeMapLiteral extends CodeConfigProxyNode<CodeMapLiteral>
    implements CodeExpr {
  final Map<String, CodeExpr> values;

  CodeMapLiteral._(this.values);

  factory CodeMapLiteral.of(Map<String, dynamic> values) {
    if (values == null) return CodeMapLiteral._(null);

    final res = <String, CodeExpr>{};

    for (final e in values.entries) {
      res[e.key] = CodeExpr.of(e.value);
    }

    return CodeMapLiteral._(res);
  }
}
