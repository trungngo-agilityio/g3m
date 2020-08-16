part of g3.armory;

class CodeArgListConfig extends CodeConfigNode<CodeArgList> {
  CodeArgListConfig(NodeBuildFunc<CodeArgList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArgListConfig.forJavaLike(Node child) =>
      CodeArgListConfig((context, param) {
        final children = param.args;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Join.commaSeparated(children);
      }, child);
}

class CodeArgList extends CodeConfigProxyNode<CodeArgList> {
  final List<CodeArg> args;

  CodeArgList(this.args);

  factory CodeArgList.ofNameType(String name, String type) =>
      CodeArgList([CodeArg.of(name: name, type: type)]);

  factory CodeArgList.ofNameTypeMap(Map<String, String> types) =>
      CodeArgList(types?.entries
          ?.map((e) => CodeArg.of(name: e.key, type: e.value))
          ?.toList());
}
