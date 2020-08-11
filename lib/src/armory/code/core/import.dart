part of g3.armory;

class CodeImportConfig extends CodeConfigNode<CodeImport> {
  CodeImportConfig(NodeBuildFunc<CodeImport> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeImportConfig.endWithNewLine(Node child) =>
      CodeImportConfig((context, statement) {
        return Container([statement.package, NewLine()]);
      }, child);
}

class CodeImport extends CodeConfigProxyNode<CodeImport> {
  /// The package to import.
  final CodePackageName package;

  final CodeDataType type;
  final CodeDataType alias;

  CodeImport({this.package, this.type, this.alias});

  factory CodeImport.single(String package, String type, {String alias}) =>
      CodeImport(
        package: CodePackageName.of(package),
        type: CodeDataType.simple(type),
      );
}
