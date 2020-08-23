part of g3.techlab;

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

  static CodeAnnotationList _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeAnnotationList>(value, (v) {
      final list = _parseNodeList<CodeAnnotation>(v, CodeAnnotation._parse);
      if (list != null) return CodeAnnotationList._(list);
      return null;
    }, error: error);
  }

  factory CodeAnnotationList.of(dynamic values) {
    return CodeAnnotationList._parse(values, error: () {
      throw '$values is not a valid annotation value list';
    });
  }
}
