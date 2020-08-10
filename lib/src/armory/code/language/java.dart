part of g3.armory;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DatCode] will
/// be automatically added in the node tree.
///
class JavaCodeFile implements Node {
  static const String syntax = 'java';
  static const String extension = 'java';

  /// The file name without extension.
  final String name;

  /// The header file comment.
  final Node comment;

  /// The file content.
  final Node source;

  JavaCodeFile(this.name, this.comment, this.source);

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: extension,
      syntax: syntax,
      comment: comment,
      source: JavaCode(source),
    );
  }
}

/// Defines global configuration for dart code generation.
///
/// Java default syntax:
/// - Indentation: 2 spaces
/// - Comment: Triple splash
/// - Block: Curly bracket start at the same line.
///
class JavaCode implements Node {
  final Node content;

  JavaCode(this.content);

  @override
  Node build(BuildContext context) {
    return IndentationConfig.useSpace2(
      CodeBlockConfig.curlyBracketSameLine(
        CodeCommentConfig.forJavaLike(
          CodeDataTypeConfig.forJavaLike(
            CodeStatementListConfig.asIs(
              CodeStatementConfig.endWithCommaAndNewLine(
                _buildGenericConfig(
                  _buildFieldConfig(
                    _buildFunctionConfig(
                      _buildClassConfig(
                        content,
                      ),
                    ),
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
                  CodeFunctionBodyConfig.asCodeBlock(
                    CodeFunctionConfig.forJavaLike(child),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Node _buildClassConfig(Node child) {
    return CodeClassNameConfig.pascalCase(
      CodeClassConfig.of(
        child,
      ),
    );
  }
}