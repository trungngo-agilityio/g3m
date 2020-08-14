part of g3.armory;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DatCode] will
/// be automatically added in the node tree.
///
class JsonCodeFile implements Node {
  static const String syntax = 'json';
  static const String extension = 'json';

  /// The file name without extension.
  final String name;

  /// The file content.
  final CodeMapLiteral source;

  JsonCodeFile(this.name, {this.source});

  factory JsonCodeFile.of(
    String name, {
    Map<String, dynamic> body,
  }) {
    return JsonCodeFile(name, source: CodeMapLiteral.of(body));
  }

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: extension,
      syntax: syntax,
      source: JsonCode(source),
    );
  }
}

class JsonCode extends ExactlyOneNode<JsonCode> {
  JsonCode(Node child) : super(child);

  @override
  Node buildOne(BuildContext context, Node child) {
    return IndentConfig.useSpace2(
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
              CodeArrayLiteralConfig.forJsonLike(
                CodeMapLiteralConfig.forJsonLike(
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
