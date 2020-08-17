part of g3.armory;

abstract class _CodeStatementLike {}

class CodeStatementConfig extends CodeConfigNode<CodeStatement> {
  CodeStatementConfig(NodeBuildFunc<CodeStatement> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeStatementConfig.forJavaLike(Node child) =>
      CodeStatementConfig((context, statement) {
        return statement.child;
      }, child);
}

class CodeStatement extends CodeConfigProxyNode<CodeStatement> {
  final Node child;
  final bool terminated;

  CodeStatement._(@required this.child, {this.terminated});

  factory CodeStatement._parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeStatement>(value, (v) {
      if (v is Node) return CodeStatement._(v);
      return CodeStatement._(CodeExpr.of(value));
    }, error: error);
  }

  factory CodeStatement.of(dynamic text) {
    return CodeStatement._parse(text);
  }
}
