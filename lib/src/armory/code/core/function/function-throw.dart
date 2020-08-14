part of g3.armory;

class CodeFunctionThrowConfig extends CodeConfigNode<CodeFunctionThrow> {
  CodeFunctionThrowConfig(
      NodeBuildFunc<CodeFunctionThrow> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionThrowConfig.forJavaLike(Node child) =>
      CodeFunctionThrowConfig((context, funcThrow) {
        return funcThrow.name;
      }, child);
}

class CodeFunctionThrow extends CodeConfigProxyNode<CodeFunctionThrow> {
  final CodeType name;

  CodeFunctionThrow(this.name);

  factory CodeFunctionThrow.simple(String name) =>
      CodeFunctionThrow(CodeType.simple(name));
}
