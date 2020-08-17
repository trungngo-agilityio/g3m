part of g3.armory;

class CodeExprConfig extends CodeConfigNode<CodeExpr> {
  CodeExprConfig(NodeBuildFunc<CodeExpr> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeExprConfig.forJavaLike(Node child) =>
      CodeExprConfig((context, expr) {
        final child = expr.child;

        // The algorithm to generate an statement separator is
        // a little tricky. Given an expression, we will need to
        // determine if we need to generator extra ";" at the end or
        // not. The algorithm is:
        // - If the expression is self-terminated then we don't
        //   need to generate extra ";".
        // - What up the tree util hitting some container.
        // - If the container is an expression than we don't need to do
        //   anything. Just let the parent to do the job.
        // - If the container is not an expression then we will need
        //   to generate an extra ";".
        //
        if (expr.terminated == true) return expr.child;

        final container = context.ancestors.firstWhere(
            (e) =>
                e is CodeExpr ||
                e is CodeStatement ||
                e is CodeSyntax ||
                e is CodeBlock,
            orElse: () => null);

        if (!(container is CodeStatement)) return child;

        return TextTransform(expr.child, (s) {
          s = s?.trim();
          if (s.isNotEmpty) return s + ';\n';
          return '\n';
        });
      }, child);
}

/// Expression is the most basic element of many language. Example are
/// Some sample expression are [CodeBoolLiteral], [CodeStringLiteral]
/// can be found in many programming language. Multiple expressions
/// can be group together to build more complex expression. For instance,
/// [CodeFunctionCall] is an expression that have each of its arguments
/// are expressions as well.
///
/// Most expressions can be treated as a [CodeStatement] if it is
/// terminated.
///
class CodeExpr extends CodeConfigProxyNode<CodeExpr> {
  final Node child;

  /// True determines that this expression is self terminated.
  /// This is useful for any language that requires adding a ";"
  /// at the end of the statement.
  final bool terminated;

  CodeExpr._(this.child, this.terminated);

  factory CodeExpr.open(Node child) =>
      child == null ? null : CodeExpr._(child, false);

  factory CodeExpr.closed(Node child) =>
      child == null ? null : CodeExpr._(child, true);

  factory CodeExpr._parse(dynamic value,
      {bool terminated, _NodeParseErrorFunc error}) {
    return _parseNode(value, (v) {
      Node child;
      if (v is Node) {
        return CodeExpr._(v, terminated);
      } else if (v == null) {
        child = CodeNullLiteral();
      } else if (value is bool) {
        child = CodeBoolLiteral.of(value);
      } else if (value is String) {
        child = CodeStringLiteral.of(value);
      } else if (value is num) {
        child = CodeNumericLiteral.of(value);
      } else if (value is List<dynamic>) {
        child = CodeArrayLiteral.of(value);
      } else if (value is Map<String, dynamic>) {
        child = CodeMapLiteral.of(value);
      } else {
        child = Text.of(v);
      }
      return CodeExpr._(child, terminated);
    }, error: error);
  }

  factory CodeExpr.of(dynamic value, {bool closed}) {
    return CodeExpr._parse(value, terminated: closed);
  }

  static List<CodeExpr> listOf(dynamic value, {bool terminated}) {
    return _parseNodeList<CodeExpr>(
            value, (v) => CodeExpr.of(v, closed: terminated))
        ?.where((e) => e != null)
        ?.toList();
  }
}
