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

  /// The file content.
  final Node source;

  JavaCodeFile(this.name, {this.source});

  factory JavaCodeFile.of(
    String name, {
    CodePackage package,
    CodeComment comment,
    List<CodeImport> imports,
    List<CodeFunction> functions,
    List<CodeInterface> interfaces,
    List<CodeClass> classes,
    Node body,
  }) {
    var source = Container([
      comment,
      package,
      CodeImportList.of(imports),
      CodeFunctionList.of(functions),
      CodeInterfaceList.of(interfaces),
      CodeClassList.of(classes),
      body,
    ]);

    return JavaCodeFile(name, source: source);
  }

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: extension,
      syntax: syntax,
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
class JavaCode extends ExactlyOneNode<JavaCode> {
  JavaCode(Node child) : super(child);

  @override
  Node buildOne(BuildContext context, Node child) {
    return IndentationConfig.useSpace2(
      CodeBlockConfig.curlyBracketSameLine(
        CodeCommentConfig.forJavaLike(
          _buildPackageConfig(
            _buildImportConfig(
              _buildTypeConfig(
                _buildExprConfig(
                  _buildStatementConfig(
                    _buildDataType(
                      _buildCodeAccess(
                        _buildGenericConfig(
                          _buildFieldConfig(
                            _buildFunctionConfig(
                              _buildInterfaceConfig(
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
      ),
    );
  }

  Node _buildCodeAccess(Node child) {
    return CodeAccessConfig.of(child);
  }

  Node _buildDataType(Node child) {
    return CodeTypeNameConfig.forJavaLike(
      CodeTypeConfig.forDartLike(
        child,
      ),
    );
  }

  Node _buildPackageConfig(Node child) {
    return CodePackageNameConfig.forJavaLike(
      CodePackageConfig.forJavaLike(child),
    );
  }

  Node _buildImportConfig(Node child) {
    return CodeImportConfig.forJavaLike(
      CodeImportListConfig.forJavaLike(
        CodeImportTypeConfig.forJavaLike(
          child,
        ),
      ),
    );
  }

  Node _buildTypeConfig(Node child) {
    return CodeTypeNameConfig.forJavaLike(
      CodeTypeConfig.forJavaLike(
        CodeTypeListConfig.commaSeparated(
          child,
        ),
      ),
    );
  }

  Node _buildExprConfig(Node child) {
    return CodeNullLiteralConfig.forJavaLike(
      CodeBoolLiteralConfig.forJavaLike(
        CodeCharLiteralConfig.forJavaLike(
          CodeStringLiteralConfig.forJavaLike(
            CodeNumericLiteralConfig.forJavaLike(
              child,
            ),
          ),
        ),
      ),
    );
  }

  Node _buildStatementConfig(Node child) {
    return CodeStatementListConfig.asIs(
      CodeStatementConfig.endWithCommaAndNewLine(
        CodeBreakConfig.forJavaLike(
          CodeContinueConfig.forJavaLike(
            CodeVarNameConfig.forJavaLike(
              child,
            ),
          ),
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

  Node _buildInterfaceConfig(Node child) {
    return CodeInterfaceConfig.forJavaLike(
      CodeInterfaceListConfig.newLineSeparated(
        child,
      ),
    );
  }

  Node _buildClassConfig(Node child) {
    return CodeClassNameConfig.forJavaLike(
      CodeClassConfig.forJavaLike(
        CodeClassListConfig.newLineSeparated(
          CodeClassConstructorConfig.forJavaLike(
            CodeClassConstructorListConfig.newLineSeparated(
              child,
            ),
          ),
        ),
      ),
    );
  }
}
