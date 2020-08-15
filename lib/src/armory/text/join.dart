part of g3.armory;

class Join implements Node {
  final Node separator;
  final List<Node> children;

  Join(this.separator, this.children);

  factory Join.newLineSeparated(List<Node> children) => Join.of('\n', children);

  factory Join.notSeparated(List<Node> children) => Join.of('', children);

  factory Join.commaSeparated(List<Node> children) => Join.of(', ', children);

  factory Join.spaceSeparated(List<Node> children) => Join.of(' ', children);

  factory Join.of(String separator, List<Node> children) =>
      children?.isNotEmpty == true ? Join(Text.of(separator), children) : null;

  @override
  Node build(BuildContext context) {
    final res = <Node>[children[0]];
    for (var i = 1; i < children.length; i++) {
      res.add(separator);
      res.add(children[i]);
    }
    return Container(res);
  }
}
