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
          CodeDataTypeConfig.forDartLike(
            CodeStatementConfig.endWithCommaAndNewLine(
              CodeClassNameConfig.pascalCase(
                _buildGenericConfig(
                  _buildFieldConfig(
                    _buildFunctionConfig(content),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Node _buildGenericConfig(Node child) {
    return CodeGenericParamConfig.asIs(
      CodeGenericParamListConfig.commaSeparated(
        child,
      ),
    );
  }

  Node _buildFieldConfig(Node child) {
    return CodeFieldNameConfig.camelCase(
      CodeFieldConfig.typeThenName(
        child,
      ),
    );
  }

  Node _buildFunctionConfig(Node child) {
    return CodeFunctionNameConfig.camelCase(
      CodeFunctionArgListConfig.commaSeparated(
        CodeFunctionArgConfig.typeSpaceName(
          CodeFunctionReturnListConfig.commaSeparated(
            CodeFunctionReturnConfig.asIs(
              CodeFunctionThrowListConfig.commaSeparated(
                CodeFunctionThrowConfig.asIs(
                  CodeFunctionBodyConfig.asCodeBlock(child),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
