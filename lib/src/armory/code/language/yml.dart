part of g3.armory;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DatCode] will
/// be automatically added in the node tree.
///
class YmlCodeFile implements Node {
  static const String syntax = 'yml';
  static const String extension = 'yml';

  /// The file name without extension.
  final String name;

  /// The file content.
  final CodeMapLiteral source;

  YmlCodeFile(this.name, {this.source});

  factory YmlCodeFile.of(
    String name, {
    Map<String, dynamic> body,
  }) {
    return YmlCodeFile(name, source: CodeMapLiteral.of(body));
  }

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: extension,
      syntax: syntax,
      source: YmlCode(source),
    );
  }
}

/// Defines global configuration for dart code generation.
///
/// Yml default syntax:
/// - Indentation: 2 spaces
/// - Comment: Triple splash
/// - Block: Curly bracket start at the same line.
///
class YmlCode extends ExactlyOneNode<YmlCode> {
  YmlCode(Node child) : super(child);

  @override
  Node buildOne(BuildContext context, Node child) {
    return IndentationConfig.useSpace2(
      CodeBlockConfig.curlyBracketSameLine(
        _buildExprConfig(
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
              CodeArrayLiteralConfig.forYmlLike(
                CodeMapLiteralConfig.forYmlLike(
                  child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
