part of g3.armory;

class CodeGroupExpr extends SingleChildNode {
  final List<CodeExpr> children;

  CodeGroupExpr({
    @required this.children,
  }) : super(Pad.parentheses(Join.commaSeparated(children)));

  factory CodeGroupExpr.of(
    dynamic value,
  ) {
    var list = CodeExpr.listOf(value);
    if (list?.isNotEmpty != true) return null;
    return CodeGroupExpr(children: list);
  }
}
