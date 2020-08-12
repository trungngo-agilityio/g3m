part of g3.armory;

class CodeFunctionArgNameConfig extends CodeConfigNode<CodeFunctionArgName> {
  CodeFunctionArgNameConfig(
      NodeBuildFunc<CodeFunctionArgName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionArgNameConfig.of(StringFunc func, Node child) =>
      CodeFunctionArgNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeFunctionArgNameConfig.forJavaLike(Node child) =>
      CodeFunctionArgNameConfig.of(camel, child);
}

class CodeFunctionArgName extends CodeConfigProxyNode<CodeFunctionArgName> {
  final Node content;

  CodeFunctionArgName(this.content);

  factory CodeFunctionArgName.of(String text) {
    return text == null ? null : CodeFunctionArgName(Text(text));
  }
}
