part of g3.armory;

class CodePropertyListConfig extends CodeConfigNode<CodePropertyList> {
  CodePropertyListConfig(NodeBuildFunc<CodePropertyList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePropertyListConfig.forJavaLike(Node child) =>
      CodePropertyListConfig((context, param) {
        final children = param.properties;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container(children);
      }, child);
}

class CodePropertyList extends CodeConfigProxyNode<CodePropertyList> {
  final List<CodeProperty> properties;

  CodePropertyList._(this.properties);

  factory CodePropertyList.of(List<CodeProperty> properties) =>
      properties?.isNotEmpty == true ? CodePropertyList._(properties) : null;

  factory CodePropertyList.ofNameType(String name, String type) =>
      CodePropertyList._([CodeProperty.of(name: name, type: type)]);

  factory CodePropertyList.ofNameTypeMap(Map<String, String> types) =>
      CodePropertyList._(types?.entries
          ?.map((e) => CodeProperty.of(name: e.key, type: e.value))
          ?.toList());
}
