part of g3.armory;

class CodeFunctionReturnConfig extends CodeConfigNode<CodeFunctionReturn> {
  CodeFunctionReturnConfig(
      NodeBuildFunc<CodeFunctionReturn> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionReturnConfig.asIs(Node child) =>
      CodeFunctionReturnConfig((context, funcReturn) {
        return funcReturn.type;
      }, child);
}

class CodeFunctionReturn extends CodeConfigProxyNode<CodeFunctionReturn> {
  final CodeType type;

  CodeFunctionReturn(this.type);

  factory CodeFunctionReturn.simple(String type) =>
      CodeFunctionReturn(CodeType.simple(type));
}
