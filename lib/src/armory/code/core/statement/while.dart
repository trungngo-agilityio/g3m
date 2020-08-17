part of g3.armory;

class CodeWhileConfig extends CodeConfigNode<CodeWhile> {
  CodeWhileConfig(NodeBuildFunc<CodeWhile> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeWhileConfig.forJavaLike(
    Node child, {
    String whileKeyword = 'while',
  }) =>
      CodeWhileConfig((context, expr) {
        return Container([
          expr.comment,
          whileKeyword,
          ' (',
          expr.condition,
          ') ',
          CodeBlock.of(expr.body),
          '\n'
        ]);
      }, child);
}

class CodeWhile extends CodeConfigProxyNode<CodeWhile> {
  final OldCodeExpr condition;
  final CodeStatementList body;
  final CodeComment comment;

  CodeWhile({
    this.condition,
    this.body,
    this.comment,
  });

  factory CodeWhile.of(
    dynamic condition,
    List<dynamic> body, {
    String comment,
  }) =>
      CodeWhile(
        condition: OldCodeExpr.of(condition),
        body: CodeStatementList.of(body),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
