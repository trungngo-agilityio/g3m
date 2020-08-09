part of g3.armory;

class CodeFunctionConfig extends CodeConfigNode<CodeFunction> {
  CodeFunctionConfig(NodeBuildFunc<CodeFunction> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionConfig.forJavaLike(
    Node child, {
    String throwKeyword = 'throws',
  }) =>
      CodeFunctionConfig((context, func) {
        final def = Container([
          func.returns != null
              ? Container([
                  func.returns,
                  Text.space(),
                ])
              : null,
          func.name,
          func.genericParams != null
              ? Pad.of('<', '>', func.genericParams)
              : null,
          Pad.of('(', ')', func.args),
          func.throws != null
              ? Container([
                  throwKeyword != null
                      ? Container([
                          Text.space(),
                          Text(throwKeyword),
                        ])
                      : null,
                  Text.space(),
                  func.throws,
                ])
              : null,
        ]);

        if (func.body == null) {
          return CodeStatement(def);
        } else {
          return Container([
            def,
            Text.space(),
            func.body,
          ]);
        }
      }, child);
}

class CodeFunction extends CodeConfigProxyNode<CodeFunction> {
  final CodeFunctionName name;
  final CodeGenericParamList genericParams;
  final CodeFunctionArgList args;
  final CodeFunctionReturnList returns;
  final CodeFunctionThrowList throws;
  final CodeFunctionBody body;

  CodeFunction({
    @required this.name,
    this.genericParams,
    this.args,
    this.returns,
    this.throws,
    this.body,
  });

  factory CodeFunction.of({
    @required String name,
    List<String> genericParams,
    Map<String, String> args,
    List<String> returns,
    List<String> throws,
    List<String> body,
  }) =>
      CodeFunction(
        name: CodeFunctionName.of(name),
        genericParams: genericParams != null
            ? CodeGenericParamList.list(genericParams)
            : null,
        args: args != null ? CodeFunctionArgList.ofNameTypeMap(args) : null,
        returns: returns != null ? CodeFunctionReturnList.list(returns) : null,
        throws: throws != null ? CodeFunctionThrowList.list(throws) : null,
        // TODO
        body: body != null
            ? CodeFunctionBody(CodeStatementList.list(body))
            : null,
      );
}
