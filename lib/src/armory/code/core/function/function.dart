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
          func.comment,
          func.returns != null
              ? Container([
                  func.returns,
                  Text.space(),
                ])
              : null,
          func.name,
          func.generic != null ? Pad.of('<', '>', func.generic) : null,
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
  final CodeComment comment;
  final CodeGenericParamList generic;
  final CodeFunctionArgList args;
  final CodeFunctionReturnList returns;
  final CodeFunctionThrowList throws;
  final CodeFunctionBody body;

  CodeFunction({
    @required this.name,
    this.comment,
    this.generic,
    this.args,
    this.returns,
    this.throws,
    this.body,
  });

  factory CodeFunction.of({
    @required String name,
    String comment,
    List<String> generic,
    Map<String, String> args,
    List<String> returns,
    List<String> throws,
    List<String> body,
  }) =>
      CodeFunction(
        name: CodeFunctionName.of(name),
        comment: CodeComment.text(comment),
        generic: generic != null ? CodeGenericParamList.list(generic) : null,
        args: args != null ? CodeFunctionArgList.ofNameTypeMap(args) : null,
        returns: returns != null ? CodeFunctionReturnList.list(returns) : null,
        throws: throws != null ? CodeFunctionThrowList.list(throws) : null,
        // TODO
        body: body != null
            ? CodeFunctionBody(CodeStatementList.list(body))
            : null,
      );
}