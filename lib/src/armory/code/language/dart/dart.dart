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

  /// The file content.
  final Node source;

  DartCodeFile(
    this.name, {
    this.source,
  });

  factory DartCodeFile.of(
    String name, {
    CodePackage package,
    CodeImportList imports,
    CodeComment comment,
    CodeFunctionList functions,
    CodeClassList classes,
    Node body,
  }) {
    var source = Container([
      comment,
      package,
      imports,
      functions,
      classes,
      body,
    ]);

    return DartCodeFile(name, source: source);
  }

  @override
  Node build(BuildContext context) {
    return DartCode(
      CodeFile(
        name: name,
        extension: extension,
        syntax: syntax,
        source: source,
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
class DartCode extends ExactlyOneNode<DartCode> {
  DartCode(Node child) : super(child);

  @override
  Node buildOne(BuildContext context, Node child) {
    return IndentationConfig.useSpace2(
      CodeBlockConfig.curlyBracketSameLine(
        CodeCommentConfig.forDartLike(
          _buildPackageConfig(
            _buildImportConfig(
              CodeDataTypeConfig.forDartLike(
                CodeStatementListConfig.asIs(
                  CodeStatementConfig.endWithCommaAndNewLine(
                    _buildDataType(
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
        ),
      ),
    );
  }

  Node _buildCodeAccess(Node child) {
    return CodeAccessConfig.of(child);
  }

  Node _buildDataType(Node child) {
    return CodeDataTypeNameConfig.forJavaLike(
      CodeDataTypeConfig.forDartLike(
        child,
      ),
    );
  }

  Node _buildPackageConfig(Node child) {
    return CodePackageNameConfig.forJavaLike(
      CodePackageConfig.forJavaLike(child, packageKeyword: 'library'),
    );
  }

  Node _buildImportConfig(Node child) {
    return CodeImportConfig.forDartLike(
      CodeImportListConfig.forJavaLike(
        CodeImportTypeConfig.forJavaLike(
          child,
        ),
      ),
    );
  }

  Node _buildGenericConfig(Node child) {
    return CodeGenericParamConfig.asIs(
      CodeGenericParamListConfig.forJavaLike(
        child,
      ),
    );
  }

  Node _buildFieldConfig(Node child) {
    return CodeFieldNameConfig.forJavaLike(
      CodeFieldListConfig.newLineSeparated(
        CodeFieldConfig.typeThenName(
          child,
        ),
      ),
    );
  }

  Node _buildFunctionConfig(Node child) {
    return CodeFunctionNameConfig.forJavaLike(
      CodeFunctionArgNameConfig.forJavaLike(
        CodeFunctionArgListConfig.commaSeparated(
          CodeFunctionArgConfig.typeSpaceName(
            CodeFunctionReturnListConfig.commaSeparated(
              CodeFunctionReturnConfig.asIs(
                CodeFunctionThrowListConfig.commaSeparated(
                  CodeFunctionThrowConfig.asIs(
                    CodeFunctionListConfig.newLineSeparated(
                      CodeFunctionConfig.forJavaLike(child),
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

  Node _buildClassConfig(Node child) {
    return CodeClassNameConfig.forJavaLike(
      CodeClassConfig.forJavaLike(
        CodeClassListConfig.newLineSeparated(
          CodeClassExtendListConfig.forJavaLike(
            CodeClassExtendConfig.asIs(
              CodeClassImplementListConfig.forJavaLike(
                CodeClassImplementConfig.asIs(
                  CodeClassConstructorConfig.forJavaLike(
                    CodeClassConstructorListConfig.newLineSeparated(
                      child,
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
}
