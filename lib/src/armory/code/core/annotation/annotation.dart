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
            annotation.generic,
            '(',
            Join.commaSeparated(annotation.args),
            ')\n',
          ]),
        );
      }, child);
}

class CodeAnnotation extends CodeConfigProxyNode<CodeAnnotation> {
  /// The annotation name.
  final CodeAnnotationName name;

  /// Additional comment can be put at the annotation.
  final CodeComment comment;

  final CodeGenericParamList generic;

  final List<OldCodeExpr> args;

  CodeAnnotation._({
    @required this.name,
    this.comment,
    this.generic,
    this.args,
  }) : assert(name != null, 'annotation name is required');

  factory CodeAnnotation.of(
    dynamic name, {
    String comment,
    List<String> generic,
    List<dynamic> args,
    Node body,
  }) =>
      CodeAnnotation._(
        name: CodeAnnotationName.of(name),
        comment: comment != null ? CodeComment.of(comment) : null,
        generic: generic != null ? CodeGenericParamList.list(generic) : null,
        args: args?.map((e) => OldCodeExpr.of(e))?.toList(),
      );
}
