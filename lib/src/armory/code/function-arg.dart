part of g3.armory;

class CodeFunctionArgConfig extends CodeConfigNode<CodeFunctionArg> {
  CodeFunctionArgConfig(NodeBuildFunc<CodeFunctionArg> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionArgConfig.typeSpaceName(Node child) =>
      CodeFunctionArgConfig((context, arg) {
        return Container([arg.type, Text.space(), arg.name]);
      }, child);
}

class CodeFunctionArg extends CodeConfigProxyNode<CodeFunctionArg> {
  final CodeFunctionName name;
  final CodeDataType type;

  CodeFunctionArg(this.name, this.type);

  factory CodeFunctionArg.ofNameType(String name, String type) =>
      CodeFunctionArg(CodeFunctionName.of(name), CodeDataType.simple(type));
}
