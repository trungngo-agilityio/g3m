part of g3.armory;


class CodeEnumNameConfig extends CodeConfigNode<CodeEnumName> {
  CodeEnumNameConfig(NodeBuildFunc<CodeEnumName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumNameConfig.of(StringFunc func, Node child) =>
      CodeEnumNameConfig(
              (context, name) => TextTransform(name.content, func), child);

  factory CodeEnumNameConfig.forJavaLike(Node child) =>
      CodeEnumNameConfig.of(pascal, child);
}

class CodeEnumName extends CodeConfigProxyNode<CodeEnumName> {
  final Node content;

  CodeEnumName(this.content);

  factory CodeEnumName.of(String text) {
    return text == null ? null : CodeEnumName(Text.of(text));
  }
}