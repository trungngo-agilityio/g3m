part of g3.armory;

class CodeDataTypeNameConfig extends CodeConfigNode<CodeDataTypeName> {
  CodeDataTypeNameConfig(NodeBuildFunc<CodeDataTypeName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeDataTypeNameConfig.of(StringFunc func, Node child) =>
      CodeDataTypeNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeDataTypeNameConfig.forJavaLike(Node child) =>
      CodeDataTypeNameConfig.of(pascal, child);
}

class CodeDataTypeName extends CodeConfigProxyNode<CodeDataTypeName> {
  final Node content;

  CodeDataTypeName(this.content);

  factory CodeDataTypeName.of(String text) {
    return text == null ? null : CodeDataTypeName(Text(text));
  }
}
