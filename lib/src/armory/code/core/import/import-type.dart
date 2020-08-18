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
        return CodeExpr.open(
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

  CodeImportType._({@required this.type, this.alias});

  /// Try parse a dynamic value to an argument object.
  static CodeImportType _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeImportType>(value, (v) {
      final list = _toDynamicNodeList(v);

      if (list?.isNotEmpty != true || list.length > 2) {
        return null;
      }

      final type = CodeTypeName._parse(list[0]);
      if (type == null) return null;

      final alias =
          list.length > 1 ? CodeTypeName._parse(list[1], error: error) : null;

      return CodeImportType._(
        type: type,
        alias: alias,
      );
    }, error: error);
  }

  factory CodeImportType.of({
    @required dynamic type,
    dynamic alias,
  }) =>
      CodeImportType._(
        type: CodeTypeName.of(type),
        alias: CodeTypeName.of(alias),
      );
}
