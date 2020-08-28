part of g3.techlab;

class Container implements Node {
  final Iterable<dynamic> children;

  Container(this.children);

  @override
  Node build(BuildContext context) {
    return null;
  }
}
