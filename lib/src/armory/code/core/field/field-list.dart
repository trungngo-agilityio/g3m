part of g3.armory;

class CodeFieldListConfig extends CodeConfigNode<CodeFieldList> {
  CodeFieldListConfig(NodeBuildFunc<CodeFieldList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldListConfig.newLineSeparated(Node child) =>
      CodeFieldListConfig((context, param) {
        final children = param.fields;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container([
          NewLine(),
          NewLine(),
          Join.newLineSeparated(children),
        ]);
      }, child);
}

class CodeFieldList extends CodeConfigProxyNode<CodeFieldList> {
  final List<CodeField> fields;

  CodeFieldList._(this.fields);

  factory CodeFieldList.of(List<CodeField> fields) =>
      fields?.isNotEmpty == true ? CodeFieldList._(fields) : null;

  factory CodeFieldList.ofNameType(String name, String type) =>
      CodeFieldList._([CodeField.of(name: name, type: type)]);

  factory CodeFieldList.ofNameTypeMap(Map<String, String> types) =>
      CodeFieldList._(types?.entries
          ?.map((e) => CodeField.of(name: e.key, type: e.value))
          ?.toList());
}
