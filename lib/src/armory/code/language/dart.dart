part of g3.armory;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DartCode] will
/// be automatically added in the node tree.
///
class DartCodeFile implements Node {
  static const String syntax = 'dart';
  static const String extension = 'dart';

  /// The file name without extension.
  final String name;

  /// The header file comment.
  final CodeComment comment;

  final CodeFunctionList functions;

  final CodeClassList classes;

  /// The file content.
  final Node source;

  DartCodeFile(
    this.name, {
    this.comment,
    this.functions,
    this.classes,
    this.source,
  });

  @override
  Node build(BuildContext context) {
    return DartCode(
      CodeFile(
        name: name,
        extension: extension,
        syntax: syntax,
        comment: comment,
        source: Container([
          classes,
          functions,
        ]),
      ),
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
  final Node child;

  DartCode(this.child);

  @override
  Node build(BuildContext context) {
    return IndentationConfig.useSpace2(
      CodeBlockConfig.curlyBracketSameLine(
        CodeNameConfig.forJavaLike(
          CodeCommentConfig.forDartLike(
            CodeDataTypeConfig.forDartLike(
              CodeStatementListConfig.asIs(
                CodeStatementConfig.endWithCommaAndNewLine(
                  _buildCodeAccess(
                    _buildGenericConfig(
                      _buildFieldConfig(
                        _buildFunctionConfig(
                          _buildClassConfig(
                            child,
                          ),
                        ),
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

  Node _buildCodeAccess(Node child) {
    return CodeAccessConfig.of(child);
  }

  Node _buildGenericConfig(Node child) {
    return CodeGenericParamConfig.asIs(
      CodeGenericParamListConfig.forJavaLike(
        child,
      ),
    );
  }

  Node _buildFieldConfig(Node child) {
    return CodeFieldListConfig.newLineSeparated(
      CodeFieldConfig.typeThenName(
        child,
      ),
    );
  }

  Node _buildFunctionConfig(Node child) {
    return CodeFunctionArgListConfig.commaSeparated(
      CodeFunctionArgConfig.typeSpaceName(
        CodeFunctionReturnListConfig.commaSeparated(
          CodeFunctionReturnConfig.asIs(
            CodeFunctionThrowListConfig.commaSeparated(
              CodeFunctionThrowConfig.asIs(
                CodeFunctionBodyConfig.asCodeBlock(
                  CodeFunctionListConfig.newLineSeparated(
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
    return CodeClassConfig.forJavaLike(
      CodeClassExtendListConfig.forJavaLike(
        CodeClassExtendConfig.asIs(
          CodeClassImplementListConfig.forJavaLike(
            CodeClassImplementConfig.asIs(
              child,
            ),
          ),
        ),
      ),
    );
  }
}
