part of g3.armory;

class CodeVarConfig extends CodeConfigNode<CodeVar> {
  CodeVarConfig(NodeBuildFunc<CodeVar> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeVarConfig.forJavaLike(Node child) =>
      CodeVarConfig((context, expr) {
        return Container([
          expr.comment,
          expr.type,
          Text.space(),
          expr.name,
          expr.init != null ? Container([' = ', expr.init]) : null,
        ]);
      }, child);

  factory CodeVarConfig.forDartLike(
    Node child, {
    String varKeyword = 'var',
    String finalKeyword = 'final',
  }) =>
      CodeVarConfig((context, expr) {
        return Container([
          expr.comment,
          expr.isFinal == true ? finalKeyword : varKeyword,
          ' ',
          expr.name,
          ' ',
          expr.type,
          expr.init != null ? Container([' = ', expr.init]) : null,
        ]);
      }, child);
}

class CodeVar extends CodeConfigProxyNode<CodeVar> {
  final CodeVarName name;
  final CodeType type;
  final bool isFinal;
  final CodeExpr init;
  final CodeComment comment;

  CodeVar._({
    @required this.name,
    this.type,
    this.isFinal,
    this.init,
    this.comment,
  }) : assert(name != null, 'var name is required.');

  factory CodeVar.of({
    @required dynamic name,
    dynamic type,
    dynamic comment,
    bool isFinal,
    dynamic init,
  }) =>
      CodeVar._(
        name: CodeVarName.of(name),
        type: CodeType.of(name: type),
        init: CodeExpr.of(init),
        comment: CodeComment.of(comment),
      );
}
