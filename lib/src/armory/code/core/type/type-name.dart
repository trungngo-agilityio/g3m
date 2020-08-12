part of g3.armory;

class CodeTypeNameConfig extends CodeConfigNode<CodeTypeName> {
  CodeTypeNameConfig(NodeBuildFunc<CodeTypeName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeTypeNameConfig.of(StringFunc func, Node child) =>
      CodeTypeNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeTypeNameConfig.forJavaLike(Node child) =>
      CodeTypeNameConfig.of(pascal, child);
}

class CodeTypeName extends CodeConfigProxyNode<CodeTypeName> {
  final Node content;

  CodeTypeName(this.content);

  factory CodeTypeName.of(String text) {
    return text == null ? null : CodeTypeName(Text(text));
  }
}
