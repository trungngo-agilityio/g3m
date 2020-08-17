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

  factory CodeAnnotationList.of(dynamic value) {
    // Try to parse the input as a single list object.
    return _parseNode<CodeAnnotationList>(value, (v) {
      // Parse as a list of objects.
      var list =
          _parseNodeList<CodeAnnotation>(value, (v) => CodeAnnotation.of(v));

      if (list == null) return null;
      return CodeAnnotationList._(list);
    });
  }
}
