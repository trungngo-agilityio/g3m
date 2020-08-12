part of g3.armory;

class CodeImportListConfig extends CodeConfigNode<CodeImportList> {
  CodeImportListConfig(NodeBuildFunc<CodeImportList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeImportListConfig.forJavaLike(Node child) =>
      CodeImportListConfig((context, param) {
        final children = param.imports;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container([
          NewLine(),
          NewLine(),
          Join.notSeparated(children),
        ]);
      }, child);
}

class CodeImportList extends CodeConfigProxyNode<CodeImportList> {
  final List<CodeImport> imports;

  CodeImportList._(this.imports);

  factory CodeImportList.of(List<CodeImport> imports) =>
      imports?.isNotEmpty == true ? CodeImportList._(imports) : null;
}
