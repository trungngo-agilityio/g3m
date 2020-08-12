part of g3.armory;

class CodeFunctionArgConfig extends CodeConfigNode<CodeFunctionArg> {
  CodeFunctionArgConfig(NodeBuildFunc<CodeFunctionArg> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionArgConfig.typeSpaceName(Node child) =>
      CodeFunctionArgConfig((context, arg) {
        return Container([
          arg.type,
          ' ',
          arg.name,
          arg.init != null ? Container([' = ', arg.init]) : null,
        ]);
      }, child);
}

class CodeFunctionArg extends CodeConfigProxyNode<CodeFunctionArg> {
  final CodeFunctionArgName name;
  final CodeType type;
  final CodeExpr init;

  CodeFunctionArg(this.name, this.type, this.init);

  factory CodeFunctionArg.of(String name, {String type, dynamic init}) =>
      CodeFunctionArg(CodeFunctionArgName.of(name), CodeType.simple(type),
          CodeExpr.of(init));
}
