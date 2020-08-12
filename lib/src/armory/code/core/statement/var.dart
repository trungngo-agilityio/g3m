part of g3.armory;

class CodeVarConfig extends CodeConfigNode<CodeVar> {
  CodeVarConfig(NodeBuildFunc<CodeVar> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeVarConfig.forJavaLike(Node child) =>
      CodeVarConfig((context, expr) {
        return CodeStatement(Container([
          expr.comment,
          expr.type,
          Text.space(),
          expr.name,
          expr.init != null ? Container([' = ', expr.init]) : null,
        ]));
      }, child);

  factory CodeVarConfig.forDartLike(
    Node child, {
    String varKeyword = 'var',
    String finalKeyword = 'final',
  }) =>
      CodeVarConfig((context, expr) {
        return CodeStatement(Container([
          expr.comment,
          expr.isFinal == true ? finalKeyword : varKeyword,
          ' ',
          expr.name,
          Text.space(),
          expr.type,
          expr.init != null ? Container([' = ', expr]) : null,
        ]));
      }, child);
}

class CodeVar extends CodeConfigProxyNode<CodeVar> {
  final CodeVarName name;
  final CodeType type;
  final bool isFinal;
  final CodeExpr init;
  final CodeComment comment;

  CodeVar({
    this.name,
    this.type,
    this.isFinal,
    this.init,
    this.comment,
  });

  factory CodeVar.of(String name,
          {String type, String comment, bool isFinal, dynamic init}) =>
      CodeVar(
        name: CodeVarName.of(name),
        type: CodeType.simple(type),
        init: init,
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
