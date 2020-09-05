part of g3.techlab;

class CodeIfConfig extends CodeConfigNode<CodeIf> {
  CodeIfConfig(NodeBuildFunc<CodeIf> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeIfConfig.forJavaLike(
    Node child, {
    String ifKeyword = 'if',
    String elseKeyword = 'else',
  }) {
    return CodeIfConfig((context, expr) {
      return CodeExpr.closed(
        Container([
          expr.comment,
          ifKeyword,
          ' (',
          expr.condition,
          ') ',
          CodeBlock.of(expr.then),
          Container(expr.elseIfs),
          expr.orElse != null
              ? Container([
                  ' ',
                  elseKeyword,
                  ' ',
                  CodeBlock.of(expr.orElse),
                ])
              : '\n',
        ]),
      );
    }, child);
  }
}

class CodeIf extends CodeConfigProxyNode<CodeIf> {
  final CodeExpr condition;

  final CodeStatementList then;

  final List<CodeElseIf> elseIfs;

  final CodeStatementList orElse;

  final CodeComment comment;

  CodeIf({
    @required this.condition,
    @required this.then,
    this.elseIfs,
    this.orElse,
    this.comment,
  })  : assert(
            condition != null, 'condition is required for else if statement.'),
        assert(then != null, 'then block is required for else if statement.');

  factory CodeIf.of({
    @required dynamic condition,
    @required dynamic then,
    dynamic elseIfs,
    dynamic orElse,
    dynamic comment,
  }) {
    if (condition == null &&
        then == null &&
        elseIfs == null &&
        orElse == null &&
        comment == null) {
      return null;
    }

    return CodeIf(
      condition: CodeExpr.of(condition),
      then: CodeStatementList.of(then),
      elseIfs: CodeElseIf._parseList(elseIfs, error: () {
        throw 'invalid else if block found.';
      }),
      orElse: CodeStatementList.of(orElse),
      comment: comment != null ? CodeComment.of(comment) : null,
    );
  }
}
