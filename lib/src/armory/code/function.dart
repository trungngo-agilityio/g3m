part of g3.armory;

class CodeFunctionConfig extends CodeConfigNode<CodeFunction> {
  CodeFunctionConfig(NodeBuildFunc<CodeFunction> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionConfig.forJavaLike(
    Node child, {
    String throwKeyword = 'throws ',
  }) =>
      CodeFunctionConfig((context, func) {
        return Container([
          func.returns,
          Text.space(),
          func.name,
          func.genericParams != null
              ? Pad.of('<', '>', func.genericParams)
              : null,
          Pad.of('(', ')', func.args),
          Text(throwKeyword),
          func.throws,
          func.body
        ]);
      }, child);
}

class CodeFunction extends CodeConfigProxyNode<CodeFunction> {
  final CodeFunctionName name;
  final CodeGenericParamList genericParams;
  final CodeFunctionArgList args;
  final CodeFunctionReturnList returns;
  final CodeFunctionReturnList throws;
  final CodeFunctionBody body;

  CodeFunction({
    this.name,
    this.genericParams,
    this.args,
    this.returns,
    this.throws,
    this.body,
  });
}
