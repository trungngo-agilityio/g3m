part of g3.techlab.xml;

/// Defines a dart code fine.
/// This help to enforce the dart syntax and [DatCode] will
/// be automatically added in the node tree.
///
class XmlCodeFile implements Node {
  static const String syntax = 'xml';
  static const String extension = 'xml';

  /// The file name without extension.
  final String name;

  /// The file content.
  final Node source;

  /// True indicates that the file need to be overwrite all the time.
  /// False indicates that the file never get overwrite.
  /// null indicates that needs human confirm.
  final bool overwriteIfExists;

  XmlCodeFile(this.name, {this.source, this.overwriteIfExists});

  factory XmlCodeFile.of(
    String name, {
    @meta.required String rootName,
    @meta.required dynamic body,
    Map<String, dynamic> attributes,
  }) {
    assert(name != null);
    assert(rootName != null);
    return XmlCodeFile(name,
        source: Container([
          '<?xml version="1.0" encoding="UTF-8"?>\n',
          XmlElement(
            rootName,
            attributes: attributes,
            body: body,
          ),
        ]));
  }

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: extension,
      syntax: syntax,
      source: XmlCode(source),
      overwriteIfExists: overwriteIfExists,
    );
  }
}

class XmlElement implements Node {
  final String name;
  final Map<String, dynamic> attributes;
  final Node body;

  XmlElement._(this.name, {this.attributes, this.body});

  static Node _parseBody(dynamic value, {NodeParseErrorFunc error}) {
    return parseNode<Node>(value, (v) {
      if (v == null) {
        return CodeNullLiteral();
      } else if (value is bool) {
        return CodeBoolLiteral.of(value);
      } else if (value is String) {
        return CodeStringLiteral.of(value);
      } else if (value is num) {
        return CodeNumericLiteral.of(value);
      } else if (value is List<dynamic>) {
        return CodeArrayLiteral.of(value);
      } else if (value is Map<String, dynamic>) {
        return CodeMapLiteral.of(value);
      } else if (value is XmlElement) {
        return v;
      } else {
        return Text(v);
      }
    }, error: error);
  }

  factory XmlElement(
    String name, {
    Map<String, dynamic> attributes,
    dynamic body,
  }) {
    return XmlElement._(name,
        attributes: attributes, body: XmlElement._parseBody(body));
  }

  @override
  Node build(BuildContext context) {
    final pairs = attributes?.entries?.map(
      (e) {
        final k = e.key;
        return Container([
          ' ',
          k,
          '="',
          e.value,
          '"',
        ]);
      },
    )?.toList();

    return Container([
      '<',
      name,
      pairs,
      '>',
      body,
      '</',
      name,
      '>\n',
    ]);
  }
}

class XmlCode extends ExactlyOneNode<XmlCode> {
  XmlCode(Node child) : super(child);

  @override
  Node buildOne(BuildContext context, Node child) {
    return IndentConfig.useSpace2(
      CodeBlockConfig.colonIndent(
        _buildExprConfig(
          child,
        ),
      ),
    );
  }

  Node _buildExprConfig(Node child) {
    return CodeNullLiteralConfig.forXml(
      CodeStringLiteralConfig.forYamlLike(
        CodeBoolLiteralConfig.forJavaLike(
          CodeCharLiteralConfig.forJavaLike(
            CodeNumericLiteralConfig.forJavaLike(
              CodeExprConfig.forJavaLike(
                CodeArrayLiteralConfig.forXml(
                  CodeMapLiteralConfig.forXml(
                    child,
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
