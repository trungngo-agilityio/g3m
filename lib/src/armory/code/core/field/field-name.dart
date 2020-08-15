part of g3.armory;

class CodeFieldNameConfig extends CodeConfigNode<CodeFieldName> {
  CodeFieldNameConfig(NodeBuildFunc<CodeFieldName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldNameConfig.of(StringFunc func, Node child) =>
      CodeFieldNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeFieldNameConfig.forJavaLike(Node child) =>
      CodeFieldNameConfig.of(StringFuncs.camel, child);
}

class CodeFieldName extends CodeConfigProxyNode<CodeFieldName> {
  final Node content;

  CodeFieldName(this.content);

  factory CodeFieldName.of(String text) {
    return text == null ? null : CodeFieldName(Text.of(text));
  }
}
