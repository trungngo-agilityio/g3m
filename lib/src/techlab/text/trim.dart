part of g3.techlab;

class Trim implements Node {
  final bool left;
  final bool right;
  final Node content;

  Trim._(this.left, this.right, this.content);

  factory Trim(bool left, bool right, dynamic content) =>
      Trim._(left, right, Node.of(content));

  factory Trim.left(dynamic content) => Trim(true, false, content);

  factory Trim.right(dynamic content) => Trim(false, true, content);

  factory Trim.leftRight(dynamic content) => Trim(true, true, content);

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
