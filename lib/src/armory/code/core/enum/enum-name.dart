part of g3.armory;

class CodeEnumNameConfig extends CodeConfigNode<CodeEnumName> {
  CodeEnumNameConfig(NodeBuildFunc<CodeEnumName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumNameConfig.forJavaLike(Node child) =>
      CodeEnumNameConfig._internal(child);

  factory CodeEnumNameConfig.forDartLike(Node child) =>
      CodeEnumNameConfig._internal(
        child,
        privatePrefix: '_',
      );

  factory CodeEnumNameConfig._internal(
    Node child, {
    StringFunc func,
    String privatePrefix = '',
  }) {
    func ??= StringFuncs.pascal;
    return CodeEnumNameConfig((_, arg) {
      return Container([
        arg.isPrivate == true ? privatePrefix : null,
        TextTransform(arg.name, func),
      ]);
    }, child);
  }
}

class CodeEnumName extends CodeConfigProxyNode<CodeEnumName>
    implements _NamedNode {
  @override
  final Node name;

  /// True indicates this field name is private.
  final bool isPrivate;

  CodeEnumName._({
    @required this.name,
    @required this.isPrivate,
  }) : assert(name != null);

  static CodeEnumName _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeEnumName>(value, (v) {
      // Try to parse the value as the expression name.
      final name = _parseNameNode(v, error: error);
      if (name == null) return null;
      return CodeEnumName._(
        name: name,
        isPrivate: null,
      );
    }, error: error);
  }

  factory CodeEnumName.of({
    @required dynamic name,
    bool isPrivate,
  }) {
    return CodeEnumName._(
      name: _parseNameNode(name, error: () {
        throw '$name is an invalid enum name';
      }),
      isPrivate: isPrivate,
    );
  }
}
