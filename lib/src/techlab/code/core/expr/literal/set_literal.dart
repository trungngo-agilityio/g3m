part of g3.techlab;

class CodeSetLiteralConfig extends CodeConfigNode<CodeSetLiteral> {
  CodeSetLiteralConfig(NodeBuildFunc<CodeSetLiteral> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeSetLiteralConfig.forJavaLike(
    Node child, {
    String emptySet = '{}',
    String openBracket = '{\n',
    String closeBracket = '\n}',
    String separator = ',\n',
    String prefix,
    bool indent = true,
  }) =>
      CodeSetLiteralConfig((context, literal) {
        var values = literal.values;
        if (values == null) {
          return CodeNullLiteral();
        } else if (values.isNotEmpty != true) {
          return Text(emptySet);
        }

        var body = Join.of(
            separator,
            values
                ?.map(
                  (e) => Pad.left(prefix, e),
                )
                ?.toList());

        return Container([
          openBracket,
          values.isNotEmpty ? indent == true ? Indent(body) : body : null,
          closeBracket,
        ]);
      }, child);

  factory CodeSetLiteralConfig.forYmlLike(Node child) =>
      CodeSetLiteralConfig.forJavaLike(
        child,
        emptySet: '',
        openBracket: '',
        closeBracket: '\n',
        separator: '\n',
        prefix: '- ',
      );
}

class CodeSetLiteral extends CodeConfigProxyNode<CodeSetLiteral> {
  final Iterable<CodeExpr> values;

  CodeSetLiteral._(this.values);

  factory CodeSetLiteral.of(Iterable<dynamic> value) {
    Iterable<CodeExpr> values;

    if (value == null) {
      values = null;
    } else if (value?.isNotEmpty == true) {
      values = value.map((e) => CodeExpr.of(e, acceptNull: true));
    } else {
      values = [];
    }

    return CodeSetLiteral._(values);
  }

  factory CodeSetLiteral.empty() => CodeSetLiteral._([]);
}
