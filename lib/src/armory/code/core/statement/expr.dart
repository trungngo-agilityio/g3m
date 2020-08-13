part of g3.armory;

class _CodeFreeExpr extends SingleChildNode implements CodeExpr {
  _CodeFreeExpr(Node child) : super(child);

  factory _CodeFreeExpr.text(String text) =>
      text != null ? _CodeFreeExpr(Text.of(text)) : null;
}

abstract class CodeExpr implements Node {
  factory CodeExpr.of(dynamic value) {
    if (value is CodeExpr) return value;
    if (value == null) return CodeNullLiteral();
    if (value is bool) return CodeBoolLiteral.of(value);

    // TODO, handle double etc
    if (value is int) return CodeNumericLiteral.of(value);
    if (value is String) return CodeStringLiteral.of(value);
    if (value is Node) return _CodeFreeExpr(value);
    assert(false, '${value.runtimeType.toString()} is not an expression');
    return null;
  }
}
