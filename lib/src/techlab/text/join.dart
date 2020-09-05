part of g3.techlab;

class Join implements Node {
  final Node separator;
  final Iterable<Node> children;

  Join._(this.separator, this.children);

  factory Join.newLineSeparated(Iterable<Node> children) =>
      Join.of('\n', children);

  factory Join.commaNewLineSeparated(Iterable<Node> children) =>
      Join.of(',\n', children);

  factory Join.notSeparated(Iterable<Node> children) => Join.of('', children);

  factory Join.commaSeparated(Iterable<Node> children) =>
      Join.of(', ', children);

  factory Join.spaceSeparated(Iterable<Node> children) =>
      Join.of(' ', children);

  factory Join.of(String separator, Iterable<Node> children) =>
      children?.isNotEmpty == true
          ? Join._(Text.of(separator), children)
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
