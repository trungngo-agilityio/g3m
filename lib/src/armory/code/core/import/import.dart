part of g3.armory;

class CodeImportConfig extends CodeConfigNode<CodeImport> {
  CodeImportConfig(NodeBuildFunc<CodeImport> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeImportConfig.forDartLike(
    Node child, {
    String importKeyword = 'import',
    String asKeyword = 'as',
  }) =>
      CodeImportConfig((context, import) {
        return CodeStatement.of(
          Container([
            importKeyword,
            ' \'',
            import.package,
            '\'',
            import.alias != null
                ? Container([' ', asKeyword, ' ', import.alias])
                : null,
          ]),
        );
      }, child);

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
  final CodePackageName package;
  final CodePackageName alias;
  final List<CodeImportType> types;

  CodeImport({
    @required this.package,
    this.alias,
    this.types,
  });

  factory CodeImport.of(
    String package, {
    String alias,
    List<CodeImportType> types,
  }) =>
      CodeImport(
        package: CodePackageName.of(package),
        alias: alias != null ? CodePackageName.of(alias) : null,
        types: types,
      );
}
