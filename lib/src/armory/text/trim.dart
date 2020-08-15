part of g3.armory;

class Trim implements Node {
  final bool left;
  final bool right;
  final Node content;

  Trim(this.left, this.right, this.content);

  factory Trim.left(Node content) => Trim(true, false, content);

  factory Trim.right(Node content) => Trim(false, true, content);

  factory Trim.leftRight(Node content) => Trim(true, true, content);

  @override
  Node build(BuildContext context) {
    return TextTransform(content, (s) {
      if (left == true && right == true) {
        return s.trim();
      } else if (left == true) {
        return s.trimLeft();
      } else {
        return s.trimRight();
      }
    });
  }
}
