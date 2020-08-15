part of g3.armory;

class CodeAnnotationConfig extends CodeConfigNode<CodeAnnotation> {
  CodeAnnotationConfig(NodeBuildFunc<CodeAnnotation> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAnnotationConfig.forJavaLike(
    Node child, {
    annotationKeyword = '@',
  }) =>
      CodeAnnotationConfig((context, annotation) {
        return Container([
          annotation.comment,
          annotationKeyword,
          annotation.name,
          annotation.generic,
          '(',
          Join.commaSeparated(annotation.args),
          ')\n',
        ]);
      }, child);
}

class CodeAnnotation extends CodeConfigProxyNode<CodeAnnotation> {
  final CodeAnnotationName name;
  final CodeComment comment;
  final CodeGenericParamList generic;
  final List<CodeExpr> args;

  CodeAnnotation({
    @required this.name,
    this.comment,
    this.generic,
    this.args,
  });

  factory CodeAnnotation.of(
    String name, {
    String comment,
    List<String> generic,
    List<dynamic> args,
    Node body,
  }) =>
      CodeAnnotation(
        name: CodeAnnotationName.of(name),
        comment: comment != null ? CodeComment.of(comment) : null,
        generic: generic != null ? CodeGenericParamList.list(generic) : null,
        args: args?.map((e) => CodeExpr.of(e))?.toList(),
      );
}
