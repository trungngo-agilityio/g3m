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
        return CodeStatement.of(
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
  final CodeTypeName type;
  final CodeTypeName alias;

  CodeImportType({@required this.type, this.alias});

  factory CodeImportType.of(
    String type, {
    String alias,
  }) =>
      CodeImportType(
        type: CodeTypeName.of(type),
        alias:
            alias != null && alias.isNotEmpty ? CodeTypeName.of(alias) : null,
      );
}
