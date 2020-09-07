part of g3.techlab;

class CodeImportConfig extends CodeConfigNode<CodeImport> {
  CodeImportConfig(NodeBuildFunc<CodeImport> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeImportConfig.forDartLike(
    Node child, {
    String importKeyword = 'import ',
    String exportKeyword = 'export ',
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

      return CodeExpr.open(
        Container([
          import.isExported == true ? exportKeyword : importKeyword,
          packageNode,
          pathNode,
          aliasNode,
        ]),
      );
    }, child);
  }

  factory CodeImportConfig.forTypescriptLike(
    Node child, {
    String importKeyword = 'import ',
    String exportKeyword = 'export ',
  }) {
    return CodeImportConfig((context, import) {
      final types = import.types;

      var quoteNode = StringFuncs.singleQuotes(import.path);
      if (types?.isNotEmpty == true) {
        List<Node> typeNodes = types
            .map((e) => Container([
                  e.type,
                  e.alias != null ? Container([' as ', e.alias]) : null,
                  ' ',
                ]))
            .toList();

        /// Example: import { ZipCodeValidator as ZCV } from "./ZipCodeValidator";
        return CodeExpr.open(
          Container([
            import.isExported == true ? exportKeyword : importKeyword,
            '{ ',
            Join.commaSeparated(typeNodes),
            '} from ',
            quoteNode,
          ]),
        );
      } else {
        return CodeExpr.open(
          Container([
            import.isExported == true ? exportKeyword : importKeyword,
            '* ',
            import.alias != null ? Container(['as ', import.alias, ' ']) : null,
            'from ',
            quoteNode,
          ]),
        );
      }
    }, child);
  }

  factory CodeImportConfig.forJavaLike(
    Node child, {
    String importKeyword = 'import ',
  }) =>
      CodeImportConfig((context, import) {
        if (import.types != null && import.types.isNotEmpty) {
          return Container(import.types);
        } else {
          return CodeExpr.open(
            Container([
              importKeyword,
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

  /// True indicates that the imported types should
  /// be re-exported.
  final bool isExported;

  CodeImport._({
    this.package,
    this.alias,
    this.types,
    this.path,
    this.isExported,
  });

  /// Try parse a dynamic value to an argument object.
  static CodeImport _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeImport>(value, null, error: error);
  }

  factory CodeImport.of({
    dynamic package,
    dynamic alias,
    List<CodeImportType> types,
    // FIXME dynamic?
    String path,
    bool isExported,
  }) {
    return CodeImport._(
      package: CodePackageName.of(package),
      alias: CodePackageName.of(alias),
      path: path,
      types: types,
      isExported: isExported,
    );
  }
}
