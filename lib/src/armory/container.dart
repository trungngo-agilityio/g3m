part of g3.armory;

class Container implements Node {
  final List<Node> children;

  Container(this.children);

  @override
  Node build(BuildContext context) {
    return null;
  }
}
