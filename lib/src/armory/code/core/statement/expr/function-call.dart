part of g3.armory;

class CodeFunctionCallConfig extends CodeConfigNode<CodeFunctionCall> {
  CodeFunctionCallConfig(NodeBuildFunc<CodeFunctionCall> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionCallConfig.forJavaLike(Node child) =>
      CodeFunctionCallConfig((context, func) {
        return Container([
          func.comment,
          func.name,
          func.generic,
          '(',
          Join.commaSeparated(func.args),
          ')',
        ]);
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

  factory CodeFunctionCall.of(
    String name, {
    String comment,
    List<String> generic,
    List<dynamic> args,
    Node body,
  }) =>
      CodeFunctionCall(
        name: CodeFunctionName.of(name),
        comment: comment != null ? CodeComment.of(comment) : null,
        generic: generic != null ? CodeGenericParamList.list(generic) : null,
        args: args?.map((e) => CodeExpr.of(e))?.toList(),
      );
}
