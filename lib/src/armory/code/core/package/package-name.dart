part of g3.armory;

class CodePackageNameConfig extends CodeConfigNode<CodePackageName> {
  CodePackageNameConfig(NodeBuildFunc<CodePackageName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePackageNameConfig.of(StringFunc func, Node child) =>
      CodePackageNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodePackageNameConfig.forDartLike(Node child) =>
      CodePackageNameConfig.of(StringFuncs.dot, child);

  factory CodePackageNameConfig.forJavaLike(Node child) =>
      CodePackageNameConfig.of(StringFuncs.camel, child);
}

class CodePackageName extends CodeConfigProxyNode<CodePackageName> {
  final Node content;

  CodePackageName(this.content);

  factory CodePackageName.of(String text) {
    return text == null ? null : CodePackageName(Text.of(text));
  }
}
