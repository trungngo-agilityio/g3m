part of g3.armory;

class CodeForEachConfig extends CodeConfigNode<CodeForEach> {
  CodeForEachConfig(NodeBuildFunc<CodeForEach> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeForEachConfig.forDartLike(Node child) {
    return CodeForEachConfig.forJavaLike(child, inKeyword: 'in ');
  }

  factory CodeForEachConfig.forJavaLike(
    Node child, {
    String forEachKeyword = 'for',
    String inKeyword = ': ',
  }) {
    return CodeForEachConfig((context, expr) {
      return CodeExpr.closed(
        Container([
          expr.comment,
          forEachKeyword,
          ' (',
          expr.item,
          inKeyword,
          expr.collection,
          ') ',
          CodeBlock.of(expr.body),
          '\n'
        ]),
      );
    }, child);
  }
}

class CodeForEach extends CodeConfigProxyNode<CodeForEach>
    implements _CodeStatementLike, OldCodeExpr {
  final OldCodeExpr item;
  final OldCodeExpr collection;
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
        item: OldCodeExpr.of(item),
        collection: OldCodeExpr.of(collection),
        body: CodeStatementList.of(body),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
