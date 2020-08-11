part of g3.armory;

class CodeImportTypeConfig extends CodeConfigNode<CodeImportType> {
  CodeImportTypeConfig(NodeBuildFunc<CodeImportType> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeImportTypeConfig.forJavaLike(
    Node child, {
    String importKeyword = 'import',
  }) =>
      CodeImportTypeConfig((context, import) {
        final package = context.dependOnAncestorNodeOfExactType<CodeImport>();
        return CodeStatement(
          Container([
            importKeyword,
            ' ',
            package.package,
            '.',
            import.type,
          ]),
        );
      }, child);
}

class CodeImportType extends CodeConfigProxyNode<CodeImportType> {
  final CodeDataTypeName type;
  final CodeDataTypeName alias;

  CodeImportType({@required this.type, this.alias});

  factory CodeImportType.of(
    String type, {
    String alias,
  }) =>
      CodeImportType(
        type: CodeDataTypeName.of(type),
        alias: alias != null && alias.isNotEmpty
            ? CodeDataTypeName.of(alias)
            : null,
      );
}
