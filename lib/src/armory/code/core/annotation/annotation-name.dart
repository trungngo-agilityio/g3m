part of g3.armory;

class CodeAnnotationNameConfig extends CodeConfigNode<CodeAnnotationName> {
  CodeAnnotationNameConfig(
      NodeBuildFunc<CodeAnnotationName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAnnotationNameConfig.of(StringFunc func, Node child) =>
      CodeAnnotationNameConfig(
          (context, name) => TextTransform(name.expr, func), child);

  /// For java like language, annotation name is pascal case.
  factory CodeAnnotationNameConfig.forJavaLike(Node child) =>
      CodeAnnotationNameConfig.of(StringFuncs.pascal, child);
}

class CodeAnnotationName extends CodeConfigProxyNode<CodeAnnotationName> {
  final CodeExpr expr;

  CodeAnnotationName._(this.expr);

  factory CodeAnnotationName.of(dynamic value) {
    // Try to parse the input value as the exactly first.
    return _parseNode<CodeAnnotationName>(value, (v) {
      // Try to parse the value as the expression name.
      final name = CodeExpr.of(v);
      return CodeAnnotationName._(name);
    }, error: () {
      throw '${value} is not a valid code annotation.';
    });
  }
}
