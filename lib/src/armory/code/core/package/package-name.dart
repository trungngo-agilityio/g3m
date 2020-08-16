part of g3.armory;

class CodePackageNameConfig extends CodeConfigNode<CodePackageName> {
  CodePackageNameConfig(NodeBuildFunc<CodePackageName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePackageNameConfig.forDartLike(Node child) =>
      // Don't handle anything special for dart name
      CodePackageNameConfig.of(child);

  factory CodePackageNameConfig.forJavaLike(Node child) =>
      CodePackageNameConfig.of(child);

  factory CodePackageNameConfig.of(
    Node child, {
    StringFunc nameFunc,
  }) {
    nameFunc ??= StringFuncs.snake;

    return CodePackageNameConfig((context, name) {
      return TextTransform(name.content, nameFunc);
    }, child);
  }
}

class CodePackageName extends CodeConfigProxyNode<CodePackageName> {
  final Node content;

  CodePackageName(this.content);

  factory CodePackageName.of(String text) {
    return text == null ? null : CodePackageName(Text.of(text));
  }

  static List<CodePackageName> listOf(List<String> texts) {
    if (texts?.isNotEmpty != true) return null;
    return texts.map((e) => CodePackageName.of(e)).toList();
  }
}
