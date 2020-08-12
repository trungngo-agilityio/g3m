part of g3.armory;

class CodeIfConfig extends CodeConfigNode<CodeIf> {
  CodeIfConfig(NodeBuildFunc<CodeIf> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeIfConfig.forJavaLike(
    Node child, {
    String ifKeyword = 'if',
    String elseKeyword = 'else',
  }) =>
      CodeIfConfig((context, expr) {
        return CodeStatement(Container([
          expr.comment,
          ifKeyword,
          ' (',
          expr.condition,
          ') ',
          expr.thenBlock,
          expr.elseIfBlocks != null ? Container(expr.elseIfBlocks) : null,
          expr.elseBlock != null
              ? Container([
                  elseKeyword,
                  ' ',
                  expr.elseBlock,
                ])
              : null,
        ]));
      }, child);
}

class CodeIf extends CodeConfigProxyNode<CodeIf> {
  final CodeExpr condition;
  final CodeBlock thenBlock;
  final List<CodeElseIf> elseIfBlocks;
  final CodeBlock elseBlock;
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
    dynamic thenBlock, {
    List<CodeElseIf> elseIfBlocks,
    dynamic elseBlock,
    String comment,
  }) =>
      CodeIf(
        condition: CodeExpr.of(condition),
        thenBlock: CodeBlock.of(thenBlock),
        elseIfBlocks: elseIfBlocks,
        elseBlock: CodeBlock.of(elseBlock),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
