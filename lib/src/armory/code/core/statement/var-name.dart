part of g3.armory;

class CodeVarNameConfig extends CodeConfigNode<CodeVarName> {
  CodeVarNameConfig(NodeBuildFunc<CodeVarName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeVarNameConfig.of(StringFunc func, Node child) =>
      CodeVarNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeVarNameConfig.forJavaLike(Node child) =>
      CodeVarNameConfig.of(camel, child);
}

class CodeVarName extends CodeConfigProxyNode<CodeVarName> implements CodeExpr {
  final Node content;

  CodeVarName(this.content);

  factory CodeVarName.of(String text) {
    return text == null ? null : CodeVarName(Text.of(text));
  }
}
