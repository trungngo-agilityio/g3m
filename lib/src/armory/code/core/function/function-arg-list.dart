part of g3.armory;

class CodeFunctionArgListConfig extends CodeConfigNode<CodeFunctionArgList> {
  CodeFunctionArgListConfig(
      NodeBuildFunc<CodeFunctionArgList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionArgListConfig.commaSeparated(Node child) =>
      CodeFunctionArgListConfig((context, param) {
        final children = param.args;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Join.commaSeparated(children);
      }, child);
}

class CodeFunctionArgList extends CodeConfigProxyNode<CodeFunctionArgList> {
  final List<CodeFunctionArg> args;

  CodeFunctionArgList(this.args);

  factory CodeFunctionArgList.ofNameType(String name, String type) =>
      CodeFunctionArgList([CodeFunctionArg.of(name, type: type)]);

  factory CodeFunctionArgList.ofNameTypeMap(Map<String, String> types) =>
      CodeFunctionArgList(types?.entries
          ?.map((e) => CodeFunctionArg.of(e.key, type: e.value))
          ?.toList());
}
