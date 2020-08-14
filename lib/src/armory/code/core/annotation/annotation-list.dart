part of g3.armory;

class CodeAnnotationListConfig extends CodeConfigNode<CodeAnnotationList> {
  CodeAnnotationListConfig(
      NodeBuildFunc<CodeAnnotationList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAnnotationListConfig.forJavaLike(Node child) =>
      CodeAnnotationListConfig(
          (context, param) => Container(param.annotations), child);
}

class CodeAnnotationList extends CodeConfigProxyNode<CodeAnnotationList> {
  final List<CodeAnnotation> annotations;

  CodeAnnotationList._(this.annotations);

  factory CodeAnnotationList.of(List<CodeAnnotation> annotations) =>
      annotations?.isNotEmpty == true
          ? CodeAnnotationList._(annotations)
          : null;
}
