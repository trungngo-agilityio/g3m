part of g3.armory;

class _CodeFreeExpr extends SingleChildNode implements OldCodeExpr {
  _CodeFreeExpr(Node child) : super(child);

  factory _CodeFreeExpr.text(String text) =>
      text != null ? _CodeFreeExpr(Text.of(text)) : null;
}

abstract class OldCodeExpr implements Node {
  factory OldCodeExpr.of(dynamic value) {
    if (value is OldCodeExpr) return value;
    if (value == null) return CodeNullLiteral();
    if (value is bool) return CodeBoolLiteral.of(value);

    // TODO, handle double etc
    if (value is int) return CodeNumericLiteral.of(value);
    if (value is String) return CodeStringLiteral.of(value);
    if (value is List<dynamic>) return CodeArrayLiteral.of(value);
    if (value is Map<String, dynamic>) return CodeMapLiteral.of(value);
    if (value is Node) return _CodeFreeExpr(value);
    assert(false, '${value.runtimeType.toString()} is not an expression');
    return null;
  }
}
