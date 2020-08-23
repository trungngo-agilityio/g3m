part of g3.techlab;

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
  final CodeExpr init;
  final CodeExpr condition;
  final CodeExpr step;
  final CodeStatementList body;
  final CodeComment comment;

  CodeFor._({
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
    @required dynamic body,
    dynamic comment,
  }) =>
      CodeFor._(
        init: CodeExpr.of(init),
        condition: CodeExpr.of(condition),
        step: CodeExpr.of(step),
        body: CodeStatementList.of(body),
        comment: CodeComment.of(comment),
      );
}
