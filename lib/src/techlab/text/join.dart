part of g3.techlab;

class Join implements Node {
  final Node separator;
  final Iterable<Node> children;

  Join._(this.separator, this.children);

  factory Join.doubleNewLineSeparated(Iterable<dynamic> children) =>
      Join.of('\n\n', children);

  factory Join.newLineSeparated(Iterable<dynamic> children) =>
      Join.of('\n', children);

  factory Join.commaNewLineSeparated(Iterable<dynamic> children) =>
      Join.of(',\n', children);

  factory Join.notSeparated(Iterable<dynamic> children) =>
      Join.of('', children);

  factory Join.commaSeparated(Iterable<dynamic> children) =>
      Join.of(', ', children);

  factory Join.spaceSeparated(Iterable<dynamic> children) =>
      Join.of(' ', children);

  factory Join.of(String separator, Iterable<dynamic> children) =>
      children?.isNotEmpty == true
          ? Join._(Text(separator), Node.iterableOf(children))
          : null;

  @override
  Node build(BuildContext context) {
    final list = List.of(children);
    final res = <Node>[list[0]];

    for (var i = 1; i < list.length; i++) {
      res.add(separator);
      res.add(list[i]);
    }
    return Container(res);
  }
}
