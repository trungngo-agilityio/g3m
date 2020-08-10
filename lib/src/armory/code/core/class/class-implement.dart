part of g3.armory;

class CodeClassExtendConfig extends CodeConfigNode<CodeClassExtend> {
  CodeClassExtendConfig(
      NodeBuildFunc<CodeClassExtend> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassExtendConfig.asIs(Node child) =>
      CodeClassExtendConfig((context, funcReturn) {
        return funcReturn.type;
      }, child);
}

class CodeClassExtend extends CodeConfigProxyNode<CodeClassExtend> {
  final CodeDataType type;

  CodeClassExtend(this.type);

  factory CodeClassExtend.simple(String type) =>
      CodeClassExtend(CodeDataType.simple(type));
}
