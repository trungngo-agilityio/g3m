part of g3.armory;

class DartCodeFile implements Node {
  static const String syntax = 'dart';
  static const String extension = 'dart';

  /// The file name without extension.
  final String name;

  /// The header file comment.
  final Node comment;

  /// The file content.
  final Node content;

  DartCodeFile(this.name, this.comment, this.content);

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: extension,
      syntax: syntax,
      comment: comment,
      content: CodeCommentConfig.tripleSplash(
        IndentationConfig.useSpace2(content),
      ),
    );
  }
}
