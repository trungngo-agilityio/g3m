part of g3.techlab;

class CodeSpace implements Node {
  final Node child;

  CodeSpace(this.child);

  @override
  Node build(BuildContext context) {
    if (child == null) return null;
    return TextTransform(child, (s) {
      if (s.startsWith('\n') || s.startsWith(' ')) {
        return s;
      }

      return ' ' + s;
    });
  }
}

class CodeNewLine implements Node {
  final Node child;

  CodeNewLine(this.child);

  @override
  Node build(BuildContext context) {
    if (child == null) return null;

    return TextTransform(child, (s) {
      if (s.startsWith('\n')) {
        return s;
      }

      return '\n' + s;
    });
  }
}
