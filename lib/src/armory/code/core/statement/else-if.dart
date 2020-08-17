part of g3.armory;

class CodeElseIfConfig extends CodeConfigNode<CodeElseIf> {
  CodeElseIfConfig(NodeBuildFunc<CodeElseIf> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeElseIfConfig.forJavaLike(
    Node child, {
    String ifKeyword = 'if',
    String elseKeyword = 'else',
  }) =>
      CodeElseIfConfig((context, expr) {
        return Container([
          expr.comment ?? ' ',
          elseKeyword,
          ' ',
          ifKeyword,
          ' (',
          expr.condition,
          ') ',
          CodeBlock.of(expr.thenBlock),
        ]);
      }, child);
}

class CodeElseIf extends CodeConfigProxyNode<CodeElseIf> {
  final OldCodeExpr condition;
  final CodeStatementList thenBlock;
  final CodeComment comment;

  CodeElseIf({
    this.condition,
    this.thenBlock,
    this.comment,
  });

  factory CodeElseIf.of(
    dynamic condition,
    List<dynamic> thenBlock, {
    String comment,
  }) =>
      CodeElseIf(
        condition: OldCodeExpr.of(condition),
        thenBlock: CodeStatementList.of(thenBlock),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
