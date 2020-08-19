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
  final CodeExpr condition;

  final CodeStatementList body;

  final CodeComment comment;

  CodeWhile._({
    @required this.condition,
    @required this.body,
    this.comment,
  })  : assert(condition != null, "while condition is required"),
        assert(body != null, 'while body is required');

  factory CodeWhile.of({
    dynamic condition,
    dynamic body,
    dynamic comment,
  }) =>
      CodeWhile._(
        condition: CodeExpr.of(condition),
        body: CodeStatementList.of(body),
        comment: CodeComment.of(comment),
      );
}
