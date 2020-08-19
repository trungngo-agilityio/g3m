part of g3.armory;

class CodeRefConfig extends CodeConfigNode<CodeRef> {
  CodeRefConfig(NodeBuildFunc<CodeRef> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeRefConfig.forJavaLike(Node child) =>
      CodeRefConfig((context, expr) {
        return expr.name;
      }, child);
}

class CodeRef extends CodeConfigProxyNode<CodeRef> implements _NamedNode {
  @override
  final Node name;

  CodeRef._(this.name) : assert(name != null);

  static CodeRef _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeRef>(value, (v) {
      // Try to parse the value as the expression name.
      final name = _parseNameNode(v, error: error);
      if (name == null) return null;
      return CodeRef._(name);
    }, error: error);
  }

  factory CodeRef.of(dynamic value) {
    return CodeRef._parse(value, error: () {
      throw '${value} is not a valid name.';
    });
  }

  factory CodeRef.ofThis() => CodeRef._(Text.of('this'));

  factory CodeRef.ofSuper() => CodeRef._(Text.of('super'));
}
