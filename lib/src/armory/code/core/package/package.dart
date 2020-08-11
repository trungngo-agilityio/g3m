part of g3.armory;

class CodePackageConfig extends CodeConfigNode<CodePackage> {
  CodePackageConfig(NodeBuildFunc<CodePackage> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePackageConfig.forJavaLike(
    Node child, {
    String packageKeyword = 'package',
  }) =>
      CodePackageConfig((context, package) {
        return CodeStatement(
          Join.spaceSeparated([
            Text(packageKeyword),
            package.name,
          ]),
        );
      }, child);
}

class CodePackage extends CodeConfigProxyNode<CodePackage> {
  /// The name of the package
  final CodePackageName name;

  CodePackage(this.name);

  factory CodePackage.of(String name) => CodePackage(
        CodePackageName.of(name),
      );
}

class CodePackageName extends SingleChildNode {
  CodePackageName(Node child) : super(CodeName(child));

  factory CodePackageName.of(String text) {
    return text == null ? null : CodePackageName(CodeName.of(text));
  }
}
