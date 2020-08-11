part of g3.armory;

class CodeClassNameConfig extends CodeConfigNode<CodeClassName> {
  CodeClassNameConfig(NodeBuildFunc<CodeClassName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassNameConfig.of(StringFunc func, Node child) =>
      CodeClassNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeClassNameConfig.forJavaLike(Node child) =>
      CodeClassNameConfig.of(pascal, child);
}

class CodeClassName extends CodeConfigProxyNode<CodeClassName> {
  final Node content;

  CodeClassName(this.content);

  factory CodeClassName.of(String text) {
    return text == null ? null : CodeClassName(Text(text));
  }
}
