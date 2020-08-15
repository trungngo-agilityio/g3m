part of g3.armory;

class CodeClassConstructorNameConfig
    extends CodeConfigNode<CodeClassConstructorName> {
  CodeClassConstructorNameConfig(
      NodeBuildFunc<CodeClassConstructorName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConstructorNameConfig.of(StringFunc func, Node child) =>
      CodeClassConstructorNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeClassConstructorNameConfig.forJavaLike(Node child) =>
      CodeClassConstructorNameConfig.of(StringFuncs.pascal, child);
}

class CodeClassConstructorName
    extends CodeConfigProxyNode<CodeClassConstructorName> {
  final Node content;

  CodeClassConstructorName(this.content);

  factory CodeClassConstructorName.of(String text) {
    return text == null ? null : CodeClassConstructorName(Text.of(text));
  }
}
