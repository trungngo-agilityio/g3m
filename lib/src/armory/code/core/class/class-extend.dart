part of g3.armory;

class CodeClassImplementConfig extends CodeConfigNode<CodeClassImplement> {
  CodeClassImplementConfig(
      NodeBuildFunc<CodeClassImplement> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassImplementConfig.asIs(Node child) =>
      CodeClassImplementConfig((context, funcReturn) {
        return funcReturn.type;
      }, child);
}

class CodeClassImplement extends CodeConfigProxyNode<CodeClassImplement> {
  final CodeDataType type;

  CodeClassImplement(this.type);

  factory CodeClassImplement.simple(String type) =>
      CodeClassImplement(CodeDataType.simple(type));
}
