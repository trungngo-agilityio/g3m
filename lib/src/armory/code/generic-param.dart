part of g3.armory;

class CodeGenericParamConfig extends CodeConfigNode<CodeGenericParam> {
  CodeGenericParamConfig(NodeBuildFunc<CodeGenericParam> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeGenericParamConfig.javaLike(Node child) =>
      CodeGenericParamConfig((context, param) {
        if (param.extend == null) {
          return PascalCase(param.name);
        } else {
          return Container([
            PascalCase(param.name),
            Text(' extends '),
            param.extend,
          ]);
        }
      }, child);
}

class CodeGenericParam extends CodeConfigProxyNode<CodeGenericParam> {
  final Node name;
  final CodeDataType extend;

  CodeGenericParam(this.name, {this.extend});
}
