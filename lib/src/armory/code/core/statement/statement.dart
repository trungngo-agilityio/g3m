part of g3.armory;

// FIXME remove this
abstract class _CodeStatementLike {}

class CodeStatementConfig extends CodeConfigNode<CodeStatement> {
  CodeStatementConfig(NodeBuildFunc<CodeStatement> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeStatementConfig.forJavaLike(Node child) =>
      CodeStatementConfig((context, statement) {
        final container = context.ancestors.firstWhere(
            (e) => e is CodeEnum || e is CodeConstructor || e is CodeBlock,
            orElse: () => null);

        if (container is CodeConstructor) {}
        return statement.child;
      }, child);
}

class CodeStatement extends CodeConfigProxyNode<CodeStatement> {
  final Node child;

  CodeStatement._(this.child);

  factory CodeStatement._parse(
    dynamic value, {
    bool closed,
    _NodeParseErrorFunc error,
  }) {
    // Try to parse the statement as a [CodeStatement] first.
    return _parseNode<CodeStatement>(value, (v) {
      Node child;
      // If the text is a string, gives that a priority
      // over a [CodeStringLiteral] parsed by [CodeExpr] later.
      // Notes: We wrap the text inside a [CodeExpr] so that the
      // expr is not auto terminated and can be rendered as free text.
      if (v is String) {
        child = Text._(v);
      } else if (v is Node) {
        child = v;
      } else {
        child = Text._(v?.toString());
      }

      if (closed == true) child = CodeExpr._(child, true);

      // Notes that we don't wraps the internal node in the case
      // that the statement is already closed because we want to let
      // the internal expression if any to close itself.
      return CodeStatement._(child);
    }, error: error);
  }

  factory CodeStatement.of(dynamic value, {bool closed}) {
    return CodeStatement._parse(value, closed: closed);
  }
}
