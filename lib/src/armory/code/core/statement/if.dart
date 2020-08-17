part of g3.armory;

class CodeIfConfig extends CodeConfigNode<CodeIf> {
  CodeIfConfig(NodeBuildFunc<CodeIf> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeIfConfig.forJavaLike(
    Node child, {
    String ifKeyword = 'if',
    String elseKeyword = 'else',
    String openBlock = '{',
    String closeBlock = '{',
  }) =>
      CodeIfConfig((context, expr) {
        return Container([
          expr.comment,
          ifKeyword,
          ' (',
          expr.condition,
          ') ',
          CodeBlock.of(expr.thenBlock),
          Container(expr.elseIfBlocks),
          expr.elseBlock != null
              ? Container([
                  ' ',
                  elseKeyword,
                  ' ',
                  CodeBlock.of(expr.elseBlock),
                ])
              : null,
        ]);
      }, child);
}

class CodeIf extends CodeConfigProxyNode<CodeIf> {
  final OldCodeExpr condition;
  final CodeStatementList thenBlock;
  final List<CodeElseIf> elseIfBlocks;
  final CodeStatementList elseBlock;
  final CodeComment comment;

  CodeIf({
    this.condition,
    this.thenBlock,
    this.elseIfBlocks,
    this.elseBlock,
    this.comment,
  });

  factory CodeIf.of(
    dynamic condition,
    List<dynamic> thenBlock, {
    List<CodeElseIf> elseIfBlocks,
    List<dynamic> elseBlock,
    String comment,
  }) =>
      CodeIf(
        condition: OldCodeExpr.of(condition),
        thenBlock: CodeStatementList.of(thenBlock),
        elseIfBlocks: elseIfBlocks,
        elseBlock: CodeStatementList.of(elseBlock),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
