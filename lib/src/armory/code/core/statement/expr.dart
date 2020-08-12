part of g3.armory;

class _PlainTextExpr extends SingleChildNode implements CodeExpr {
  _PlainTextExpr(Node child) : super(child);
}

abstract class CodeExpr implements Node {
  factory CodeExpr.of(dynamic value) {
    if (value == null) return null;
    if (value is CodeExpr) return value;
    if (value is bool) return CodeBoolLiteral.of(value);

    // TODO, handle double etc
    if (value is int) return CodeNumericLiteral.of(value);
    if (value is String) return CodeStringLiteral.of(value);
    return _PlainTextExpr(Text.of(value.toString()));
  }
}
