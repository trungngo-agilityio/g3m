part of g3.armory;

class CodeEnumValueNameConfig extends CodeConfigNode<CodeEnumValueName> {
  CodeEnumValueNameConfig(
      NodeBuildFunc<CodeEnumValueName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumValueNameConfig.of(StringFunc func, Node child) =>
      CodeEnumValueNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeEnumValueNameConfig.forDartLike(Node child) =>
      CodeEnumValueNameConfig.of(StringFuncs.camel, child);

  factory CodeEnumValueNameConfig.forJavaLike(Node child) =>
      CodeEnumValueNameConfig.of(StringFuncs.constant, child);
}

class CodeEnumValueName extends CodeConfigProxyNode<CodeEnumValueName>
    implements NamedNode {
  @override
  final Node name;

  CodeEnumValueName(this.name);

  factory CodeEnumValueName.of(String text) {
    return text == null ? null : CodeEnumValueName(Text.of(text));
  }
}
