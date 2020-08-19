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

class CodeForEach extends CodeConfigProxyNode<CodeForEach> {
  final CodeExpr item;
  final CodeExpr collection;
  final CodeStatementList body;
  final CodeComment comment;

  CodeForEach._({
    @required this.item,
    @required this.collection,
    @required this.body,
    this.comment,
  })  : assert(item != null, 'for each item is required.'),
        assert(collection != null, 'for each collection is required.'),
        assert(body != null, 'for each body is required.');

  factory CodeForEach.of({
    @required dynamic item,
    @required dynamic collection,
    @required dynamic body,
    String comment,
  }) {
    return CodeForEach._(
      item: CodeExpr.of(item),
      collection: CodeExpr.of(collection),
      body: CodeStatementList.of(body),
      comment: CodeComment.of(comment),
    );
  }
}
