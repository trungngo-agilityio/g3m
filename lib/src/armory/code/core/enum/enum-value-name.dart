part of g3.armory;

class CodeEnumValueNameConfig extends CodeConfigNode<CodeEnumValueName> {
  CodeEnumValueNameConfig(
      NodeBuildFunc<CodeEnumValueName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumValueNameConfig.of(StringFunc func, Node child) =>
      CodeEnumValueNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeEnumValueNameConfig.forDartLike(Node child) =>
      CodeEnumValueNameConfig.of(camel, child);

  factory CodeEnumValueNameConfig.forJavaLike(Node child) =>
      CodeEnumValueNameConfig.of(constant, child);
}

class CodeEnumValueName extends CodeConfigProxyNode<CodeEnumValueName> {
  final Node content;

  CodeEnumValueName(this.content);

  factory CodeEnumValueName.of(String text) {
    return text == null ? null : CodeEnumValueName(Text.of(text));
  }
}
