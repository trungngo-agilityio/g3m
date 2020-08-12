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
        return CodeStatement(Container([
          expr.comment,
          elseKeyword,
          ' ',
          ifKeyword,
          ' (',
          expr.condition,
          ') ',
          expr.thenBlock,
        ]));
      }, child);
}

class CodeElseIf extends CodeConfigProxyNode<CodeElseIf> {
  final CodeExpr condition;
  final CodeBlock thenBlock;
  final CodeComment comment;

  CodeElseIf({
    this.condition,
    this.thenBlock,
    this.comment,
  });

  factory CodeElseIf.of(
    dynamic condition,
    dynamic thenBlock, {
    String comment,
  }) =>
      CodeElseIf(
        condition: CodeExpr.of(condition),
        thenBlock: CodeBlock.of(thenBlock),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
