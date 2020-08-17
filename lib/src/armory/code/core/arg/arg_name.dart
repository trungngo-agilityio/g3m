part of g3.armory;

class CodeArgNameConfig extends CodeConfigNode<CodeArgName> {
  CodeArgNameConfig(NodeBuildFunc<CodeArgName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArgNameConfig.of(StringFunc func, Node child) =>
      CodeArgNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeArgNameConfig.forJavaLike(Node child) =>
      CodeArgNameConfig.of(StringFuncs.camel, child);
}

class CodeArgName extends CodeConfigProxyNode<CodeArgName>
    implements NamedNode {
  @override
  final Node name;

  CodeArgName._(this.name);

  factory CodeArgName.of(dynamic value) {
    return _parseNode<CodeArgName>(value, (v) {
      // Try to parse the value as the expression name.
      final name = NamedNode.nameOf(v);
      assert(name != null, 'argument name must not be null');
      return CodeArgName._(name);
    }, error: () {
      throw '${value} is not a valid argument.';
    });
  }
}
