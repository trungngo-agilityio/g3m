part of g3.armory;

class CodeAnnotationNameConfig extends CodeConfigNode<CodeAnnotationName> {
  CodeAnnotationNameConfig(
      NodeBuildFunc<CodeAnnotationName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeAnnotationNameConfig.of(StringFunc func, Node child) =>
      CodeAnnotationNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeAnnotationNameConfig.forJavaLike(Node child) =>
      CodeAnnotationNameConfig.of(StringFuncs.pascal, child);
}

class CodeAnnotationName extends CodeConfigProxyNode<CodeAnnotationName> {
  final Node content;

  CodeAnnotationName(this.content);

  factory CodeAnnotationName.of(String text) {
    return text == null ? null : CodeAnnotationName(Text.of(text));
  }
}
