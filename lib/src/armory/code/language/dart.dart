part of g3.armory;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DatCode] will
/// be automatically added in the node tree.
///
class DartCodeFile implements Node {
  static const String syntax = 'dart';
  static const String extension = 'dart';

  /// The file name without extension.
  final String name;

  /// The header file comment.
  final Node comment;

  /// The file content.
  final Node source;

  DartCodeFile(this.name, this.comment, this.source);

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: extension,
      syntax: syntax,
      comment: comment,
      source: DartCode(source),
    );
  }
}

/// Defines global configuration for dart code generation.
///
/// Dart default syntax:
/// - Indentation: 2 spaces
/// - Comment: Triple splash
/// - Block: Curly bracket start at the same line.
///
class DartCode implements Node {
  final Node content;

  DartCode(this.content);

  @override
  Node build(BuildContext context) {
    return IndentationConfig.useSpace2(
      CodeBlockConfig.curlyBracketSameLine(
        CodeCommentConfig.tripleSplash(
          CodeGenericParamConfig.javaLike(
            CodeGenericParamListConfig.javaLike(
              CodeDataTypeConfig.dartLike(
                content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
