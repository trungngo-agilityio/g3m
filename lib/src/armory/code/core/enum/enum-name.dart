part of g3.armory;

class CodeEnumNameConfig extends CodeConfigNode<CodeEnumName> {
  CodeEnumNameConfig(NodeBuildFunc<CodeEnumName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumNameConfig.of(StringFunc func, Node child) =>
      CodeEnumNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeEnumNameConfig.forJavaLike(Node child) =>
      CodeEnumNameConfig.of(StringFuncs.pascal, child);
}

class CodeEnumName extends CodeConfigProxyNode<CodeEnumName>
    implements NamedNode {
  @override
  final Node name;

  CodeEnumName._(this.name);

  static CodeEnumName _parse(dynamic value, {_NodeParseErrorFunc error}) {
    // Try to parse the input as the enum name itself.
    return _parseNode<CodeEnumName>(value, (v) {
      // Try to parse the input as the name expression.
      final name = NamedNode.nameOf(v);

      // Don't accept null
      if (name == null) return null;
      return CodeEnumName._(name);
    }, error: error);
  }

  factory CodeEnumName.of(dynamic value) =>
      CodeEnumName._parse(value, error: () {
        throw '$value is not a valid enum name';
      });
}
