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
  final CodeExpr item;
  final CodeExpr collection;
  final CodeStatementList body;
  final CodeComment comment;

  CodeForEach._({
    this.item,
    this.collection,
    this.body,
    this.comment,
  });

  factory CodeForEach.of({
    @required dynamic item,
    @required dynamic collection,
    @required dynamic body,
    String comment,
  }) =>
      CodeForEach._(
        item: CodeExpr.of(item),
        collection: CodeExpr.of(collection),
        body: CodeStatementList.of(body),
        comment: CodeComment.of(comment),
      );
}
