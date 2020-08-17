part of g3.armory;

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
    implements NamedNode {
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

  factory CodeAnnotation.of(
    dynamic name, {
    dynamic comment,
    dynamic args,
  }) {
    return CodeAnnotation._(
      name: CodeAnnotationName.of(name),
      comment: comment != null ? CodeComment.of(comment) : null,
      args: CodeExpr.listOf(args),
    );
  }
}
