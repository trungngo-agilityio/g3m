part of g3.techlab;

class CodeConstructorNameConfig extends CodeConfigNode<CodeConstructorName> {
  CodeConstructorNameConfig(
      NodeBuildFunc<CodeConstructorName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeConstructorNameConfig.of(StringFunc func, Node child) =>
      CodeConstructorNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeConstructorNameConfig.forJavaLike(Node child) =>
      // Java does not allow named constructor, skip it.
      CodeConstructorNameConfig.of(StringFuncs.noop, child);

  factory CodeConstructorNameConfig.forDartLike(Node child) =>
      CodeConstructorNameConfig((context, name) {
        final constructor =
            context.findAncestorNodeOfExactType<CodeConstructor>();
        Node res = TextTransform(name.name, StringFuncs.camel);

        if (constructor?.isPrivate == true ||
            constructor?.isProtected == true) {
          // Add '_' prefix for non public field.
          res = Pad.left('_', res, onlyIfMissing: true);
        }

        return res;
      }, child);
}

class CodeConstructorName extends CodeConfigProxyNode<CodeConstructorName>
    implements _NamedNode {
  @override
  final Node name;

  CodeConstructorName._(this.name);

  static CodeConstructorName _parse(dynamic value,
      {_NodeParseErrorFunc error}) {
    return _parseNode<CodeConstructorName>(value, (v) {
      // Try to parse the value as the expression name.
      final name = _parseNameNode(v, error: error);
      if (name == null) return null;
      return CodeConstructorName._(name);
    }, error: error);
  }

  factory CodeConstructorName.of(dynamic value) {
    return CodeConstructorName._parse(value, error: () {
      throw '${value} is not a valid constructor name.';
    });
  }
}
