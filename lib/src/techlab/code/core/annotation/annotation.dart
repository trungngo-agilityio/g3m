part of g3.techlab;

class CodeAnnotationConfig extends CodeConfigNode<CodeAnnotation> {
  CodeAnnotationConfig(NodeBuildFunc<CodeAnnotation> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAnnotationConfig.forJavaLike(
    Node child, {
    annotationKeyword = '@',
  }) =>
      CodeAnnotationConfig((context, annotation) {
        return CodeExpr.closed(
          Container([
            annotation.comment,
            annotationKeyword,
            annotation.name,
            '(',
            Join.commaSeparated(annotation.args),
            ')\n',
          ]),
        );
      }, child);
}

class CodeAnnotation extends CodeConfigProxyNode<CodeAnnotation>
    implements _NamedNode {
  /// The annotation name.
  @override
  final CodeAnnotationName name;

  /// Additional comment can be put at the annotation.
  final CodeComment comment;

  final CodeGenericParamList generic;

  final List<CodeExpr> args;

  CodeAnnotation._({
    @required this.name,
    this.comment,
    this.generic,
    this.args,
  }) : assert(name != null, 'annotation name is required');

  /// Try parse a dynamic value to an argument object.
  static CodeAnnotation _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeAnnotation>(value, (v) {
      final list = _toDynamicNodeList(v);

      if (list?.isNotEmpty != true || list.length > 3) {
        return null;
      }

      // Try to parse the input as the name expression.
      final name = CodeAnnotationName._parse(list[0], error: error);

      final args = list.length > 2
          ? CodeExpr._parseList(list.sublist(0), error: error)
          : null;

      return CodeAnnotation._(
        name: name,
        args: args,
      );
    }, error: error);
  }

  factory CodeAnnotation.of(
    dynamic name, {
    dynamic comment,
    dynamic args,
  }) {
    return CodeAnnotation._(
      name: CodeAnnotationName.of(name),
      comment: comment != null ? CodeComment.of(comment) : null,
      args: CodeExpr.listOf(args, acceptNull: true),
    );
  }
}
