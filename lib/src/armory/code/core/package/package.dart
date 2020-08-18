part of g3.armory;

class CodePackageConfig extends CodeConfigNode<CodePackage> {
  CodePackageConfig(NodeBuildFunc<CodePackage> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePackageConfig.forJavaLike(Node child) =>
      // Java don't allow part of keyword.
      CodePackageConfig.of(child, partOfKeyword: null);

  factory CodePackageConfig.forDartLike(Node child) =>
      // Java don't allow part of keyword.
      CodePackageConfig.of(child, packageKeyword: 'library ');

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

      return CodeExpr.open(
        Container([
          '\n',
          packageOrPartOfNode,
          pathNode,
          nameNode,
        ]),
      );
    }, child);
  }
}

class CodePackage extends CodeConfigProxyNode<CodePackage>
    implements _NamedNode {
  /// The name of the package
  @override
  final CodePackageName name;

  /// The parent packages of this package.
  final List<CodePackageName> path;

  /// True indicates that this is not a partial part.
  /// For instance, in the case of the dart language, this should be rendered
  /// as "part of" syntax.
  final bool isPart;

  CodePackage._({
    @required this.name,
    this.isPart,
    this.path,
  }) : assert(name != null);

  factory CodePackage.of(
    dynamic name, {
    List<dynamic> path,
  }) =>
      CodePackage._(
          name: CodePackageName.of(name),
          isPart: false,
          path: CodePackageName.listOf(path));

  // FIXME
  factory CodePackage.partOf(
    dynamic name, {
    List<dynamic> path,
  }) =>
      CodePackage._(
          name: CodePackageName.of(name),
          isPart: true,
          path: CodePackageName.listOf(path));
}
