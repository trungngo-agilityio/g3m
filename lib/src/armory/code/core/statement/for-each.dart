part of g3.armory;

class CodeForEachConfig extends CodeConfigNode<CodeForEach> {
  CodeForEachConfig(NodeBuildFunc<CodeForEach> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeForEachConfig.forJavaLike(
    Node child, {
    String forEachKeyword = 'for',
    String inKeyword = ': ',
  }) =>
      CodeForEachConfig((context, expr) {
        return Container([
          expr.comment,
          forEachKeyword,
          ' (',
          expr.item,
          inKeyword,
          expr.collection,
          ') ',
          CodeBlock.of(expr.body),
          '\n'
        ]);
      }, child);
}

class CodeForEach extends CodeConfigProxyNode<CodeForEach> {
  final CodeExpr item;
  final CodeExpr collection;
  final CodeStatementList body;
  final CodeComment comment;

  CodeForEach({
    this.item,
    this.collection,
    this.body,
    this.comment,
  });

  factory CodeForEach.of({
    @required dynamic item,
    @required dynamic collection,
    @required List<dynamic> body,
    String comment,
  }) =>
      CodeForEach(
        item: CodeExpr.of(item),
        collection: CodeExpr.of(collection),
        body: CodeStatementList.of(body),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
