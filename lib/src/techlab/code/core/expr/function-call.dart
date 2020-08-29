part of g3.techlab;

class CodeFunctionCallConfig extends CodeConfigNode<CodeFunctionCall> {
  CodeFunctionCallConfig(NodeBuildFunc<CodeFunctionCall> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionCallConfig.forJavaLike(Node child) =>
      CodeFunctionCallConfig((context, func) {
        return CodeExpr.open(
          Container([
            func.comment,
            func.name,
            func.generic,
            '(',
            Join.commaSeparated(func.args),
            ')',
          ]),
        );
      }, child);
}

class CodeFunctionCall extends CodeConfigProxyNode<CodeFunctionCall> {
  final CodeFunctionName name;
  final CodeComment comment;
  final CodeGenericParamList generic;
  final List<CodeExpr> args;

  CodeFunctionCall({
    @required this.name,
    this.comment,
    this.generic,
    this.args,
  });

  factory CodeFunctionCall.of({
    @required dynamic name,
    dynamic comment,
    dynamic generic,
    dynamic args,
  }) =>
      CodeFunctionCall(
        name: CodeFunctionName.of(name: name),
        comment: CodeComment.of(comment),
        generic: CodeGenericParamList.of(generic),
        args: CodeExpr.listOf(args),
      );

  factory CodeFunctionCall.ofSuper({
    dynamic comment,
    dynamic args,
  }) =>
      CodeFunctionCall.of(
        name: 'super',
        comment: comment,
        args: args,
      );
}
