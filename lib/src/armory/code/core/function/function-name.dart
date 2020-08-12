part of g3.armory;

class CodeFunctionNameConfig extends CodeConfigNode<CodeFunctionName> {
  CodeFunctionNameConfig(NodeBuildFunc<CodeFunctionName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionNameConfig.of(StringFunc func, Node child) =>
      CodeFunctionNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeFunctionNameConfig.forJavaLike(Node child) =>
      CodeFunctionNameConfig.of(camel, child);
}

class CodeFunctionName extends CodeConfigProxyNode<CodeFunctionName> {
  final Node content;

  CodeFunctionName(this.content);

  factory CodeFunctionName.of(String text) {
    return text == null ? null : CodeFunctionName(Text.of(text));
  }
}
