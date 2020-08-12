part of g3.armory;

class CodeFunctionListConfig extends CodeConfigNode<CodeFunctionList> {
  CodeFunctionListConfig(NodeBuildFunc<CodeFunctionList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionListConfig.newLineSeparated(Node child) =>
      CodeFunctionListConfig((context, param) {
        final children = param.functions;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container([
          '\n',
          Join.newLineSeparated(children),
        ]);
      }, child);
}

class CodeFunctionList extends CodeConfigProxyNode<CodeFunctionList> {
  final List<CodeFunction> functions;

  CodeFunctionList._(this.functions);

  factory CodeFunctionList.of(List<CodeFunction> functions) =>
      functions?.isNotEmpty == true ? CodeFunctionList._(functions) : null;
}
