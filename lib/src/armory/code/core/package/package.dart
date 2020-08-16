part of g3.armory;

class CodePackageConfig extends CodeConfigNode<CodePackage> {
  CodePackageConfig(NodeBuildFunc<CodePackage> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePackageConfig.forJavaLike(Node child) =>
      // Java don't allow part of keyword.
      CodePackageConfig.of(child, partOfKeyword: null);

  factory CodePackageConfig.forDartLike(Node child) =>
      // Java don't allow part of keyword.
      CodePackageConfig.of(child);

  factory CodePackageConfig.of(
    Node child, {
    String packageKeyword = 'package ',
    String partOfKeyword = 'part of ',
    String pathSeparator = '.',
  }) {
    return CodePackageConfig((context, package) {
      // Render part of or package keyword.
      final packageOrPartOfNode =
          package.isPart == true ? partOfKeyword : packageKeyword;

      // The package name.
      Node nameNode = package.name;

      // The parent path.
      Node pathNode;
      if (package.path?.isNotEmpty == true) {
        pathNode = Join.of(pathSeparator, package.path);

        // add a trailing separator to the path.
        pathNode = Pad.right(pathSeparator, pathNode);
      }

      return CodeStatement.of(
        Container([
          packageOrPartOfNode,
          pathNode,
          nameNode,
        ]),
      );
    }, child);
  }
}

class CodePackage extends CodeConfigProxyNode<CodePackage> {
  /// The name of the package
  final CodePackageName name;

  /// The parent packages of this package.
  final List<CodePackageName> path;

  /// True indicates that this is not a partial part.
  /// For instance, in the case of the dart language, this should be rendered
  /// as "part of" syntax.
  final bool isPart;

  CodePackage({@required this.name, this.isPart, this.path})
      : assert(name != null);

  factory CodePackage.of(
    String name, {
    List<String> path,
  }) =>
      CodePackage(
          name: CodePackageName.of(name),
          isPart: false,
          path: CodePackageName.listOf(path));

  factory CodePackage.partOf(
    String name, {
    List<String> path,
  }) =>
      CodePackage(
          name: CodePackageName.of(name),
          isPart: true,
          path: CodePackageName.listOf(path));
}
