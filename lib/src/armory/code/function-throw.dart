part of g3.armory;

class CodeFunctionThrowConfig extends CodeConfigNode<CodeFunctionThrow> {
  CodeFunctionThrowConfig(
      NodeBuildFunc<CodeFunctionThrow> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionThrowConfig.asIs(Node child) =>
      CodeFunctionThrowConfig((context, funcThrow) {
        return funcThrow.name;
      }, child);
}

class CodeFunctionThrow extends CodeConfigProxyNode<CodeFunctionThrow> {
  final CodeDataType name;

  CodeFunctionThrow(this.name);

  factory CodeFunctionThrow.simple(String name) =>
      CodeFunctionThrow(CodeDataType.simple(name));
}
