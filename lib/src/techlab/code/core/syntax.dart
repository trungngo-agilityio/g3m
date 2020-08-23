part of g3.techlab;

class CodeSyntax extends SingleChildNode {
  /// The syntax name. E.g., csharp, java, etc.
  final String syntax;

  final Node child;

  CodeSyntax(this.syntax, this.child) : super(child);
}
