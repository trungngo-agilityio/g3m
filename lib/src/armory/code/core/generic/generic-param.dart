part of g3.armory;

class CodeGenericParamConfig extends CodeConfigNode<CodeGenericParam> {
  CodeGenericParamConfig(NodeBuildFunc<CodeGenericParam> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeGenericParamConfig.asIs(Node child) =>
      CodeGenericParamConfig((context, param) {
        return param.name;
      }, child);
}

class CodeGenericParam extends CodeConfigProxyNode<CodeGenericParam> {
  final CodeDataType name;

  CodeGenericParam(this.name);

  factory CodeGenericParam.simple(String name) =>
      CodeGenericParam(CodeDataType.simple(name));
}
