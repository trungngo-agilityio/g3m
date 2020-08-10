part of g3.armory;

class CodeFile implements Node {
  /// The file name without extension.
  final String name;

  /// The file extension.
  final String extension;

  /// The syntax name. E.g., csharp, java, etc.
  final String syntax;

  /// The header file comment.
  final Node comment;

  /// The file content.
  final Node source;

  CodeFile({
    @required this.name,
    @required this.extension,
    this.syntax,
    this.comment,
    this.source,
  });

  @override
  Node build(BuildContext context) {
    return File(
        '${name}.${extension}',
        Container([
          CodeComment(comment),
          source,
        ]));
  }
}
