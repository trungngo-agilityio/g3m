part of g3.techlab;

class CodeAnnotationNameConfig extends CodeConfigNode<CodeAnnotationName> {
  CodeAnnotationNameConfig(
      NodeBuildFunc<CodeAnnotationName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAnnotationNameConfig.of(StringFunc func, Node child) =>
      CodeAnnotationNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  /// For java like language, annotation name is pascal case.
  factory CodeAnnotationNameConfig.forJavaLike(Node child) =>
      CodeAnnotationNameConfig.of(StringFuncs.pascal, child);
}

class CodeAnnotationName extends CodeConfigProxyNode<CodeAnnotationName>
    implements _NamedNode {
  @override
  final Node name;

  CodeAnnotationName._(this.name);

  static CodeAnnotationName _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeAnnotationName>(value, (v) {
      // Try to parse the value as the expression name.
      final name = _parseNameNode(v, error: error);
      if (name == null) return null;
      return CodeAnnotationName._(name);
    }, error: error);
  }

  factory CodeAnnotationName.of(dynamic value) {
    return CodeAnnotationName._parse(value, error: () {
      throw '${value} is not a valid annotation name.';
    });
  }
}
