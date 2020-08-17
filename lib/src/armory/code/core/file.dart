part of g3.armory;

class CodeFile implements Node, NamedNode {
  /// The file name without extension.
  @override
  final String name;

  /// The file extension.
  final String extension;

  /// The syntax name. E.g., csharp, java, etc.
  final String syntax;

  /// The file content.
  final Node source;

  CodeFile({
    @required this.name,
    @required this.extension,
    this.syntax,
    this.source,
  });

  @override
  Node build(BuildContext context) {
    return File(
      '${name}.${extension}',
      CodeSyntax(syntax, source),
    );
  }
}
