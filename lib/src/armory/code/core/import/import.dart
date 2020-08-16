part of g3.armory;

class CodeImportConfig extends CodeConfigNode<CodeImport> {
  CodeImportConfig(NodeBuildFunc<CodeImport> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeImportConfig.forDartLike(
    Node child, {
    String importKeyword = 'import ',
    String asKeyword = 'as',
    bool packageIgnored = true,
    bool pathIgnored = false,
    bool aliasIgnored = false,
    String pathQuote = '\'',
  }) {
    return CodeImportConfig((context, import) {
      // For dart, the package path is used.
      Node pathNode;
      if (pathIgnored != true && import.path != null) {
        pathNode = Pad.of(pathQuote, pathQuote, Text.of(import.path));
      }

      // Include the package name if that is not ignored.
      Node packageNode;
      if (packageIgnored != true) packageNode = import.package;

      Node aliasNode;
      if (aliasIgnored != true && import.alias != null) {
        aliasNode = Container([' ', asKeyword, ' ', import.alias]);
      }

      return CodeStatement.of(
        Container([
          importKeyword,
          packageNode,
          pathNode,
          aliasNode,
        ]),
      );
    }, child);
  }

  factory CodeImportConfig.forJavaLike(
    Node child, {
    String importKeyword = 'import',
  }) =>
      CodeImportConfig((context, import) {
        if (import.types != null && import.types.isNotEmpty) {
          return Container(import.types);
        } else {
          return CodeStatement.of(
            Container([
              importKeyword,
              ' ',
              import.package,
              '.*',
            ]),
          );
        }
      }, child);
}

class CodeImport extends CodeConfigProxyNode<CodeImport> {
  /// The package name to import.
  final CodePackageName package;

  /// The alias name for the package.
  final CodePackageName alias;

  /// The list of optional types to import in the package.
  final List<CodeImportType> types;

  /// The optional file path of where to find the package.
  final String path;

  CodeImport({
    this.package,
    this.alias,
    this.types,
    this.path,
  });

  factory CodeImport.of(
    String package, {
    String alias,
    List<CodeImportType> types,
    String path,
  }) =>
      CodeImport(
        package: CodePackageName.of(package),
        alias: alias != null ? CodePackageName.of(alias) : null,
        path: path,
        types: types,
      );

  /// Import all types from the specified [path].
  ///
  factory CodeImport.allFromPath(String path) => CodeImport(path: path);
}
