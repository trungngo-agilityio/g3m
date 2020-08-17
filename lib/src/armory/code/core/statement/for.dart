part of g3.armory;

class CodeForConfig extends CodeConfigNode<CodeFor> {
  CodeForConfig(NodeBuildFunc<CodeFor> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeForConfig.forJavaLike(
    Node child, {
    String forKeyword = 'for',
  }) =>
      CodeForConfig((context, expr) {
        return CodeExpr.closed(
          Container([
            expr.comment,
            forKeyword,
            ' (',
            expr.init,
            '; ',
            expr.condition,
            '; ',
            expr.step,
            ') ',
            CodeBlock.of(expr.body),
            '\n'
          ]),
        );
      }, child);
}

class CodeFor extends CodeConfigProxyNode<CodeFor> {
  final OldCodeExpr init;
  final OldCodeExpr condition;
  final OldCodeExpr step;
  final CodeStatementList body;
  final CodeComment comment;

  CodeFor({
    this.init,
    this.condition,
    this.step,
    this.body,
    this.comment,
  });

  factory CodeFor.of({
    @required dynamic init,
    @required dynamic condition,
    @required dynamic step,
    List<dynamic> body,
    String comment,
  }) =>
      CodeFor(
        init: OldCodeExpr.of(init),
        condition: OldCodeExpr.of(condition),
        step: OldCodeExpr.of(step),
        body: CodeStatementList.of(body),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
