part of g3.armory;

class CodeTypeNameMapperConfig extends SingleChildNode {
  final Map<String, String> map;

  CodeTypeNameMapperConfig(Node child, this.map)
      : assert(map != null),
        super(child);

  @override
  Node build(BuildContext context) {
    final parent =
        context.findAncestorNodeOfExactType<CodeTypeNameMapperConfig>();
    if (parent != null && parent.map != null) {
      // Merges parent settings
      for (final i in parent.map.entries) {
        map.putIfAbsent(StringFuncs.camel(i.key), () => i.value);
      }
    }

    return super.build(context);
  }

  String translate(String name) {
    final key = StringFuncs.camel(name);
    return map.containsKey(key) ? map[key] : name;
  }
}

class CodeTypeNameConfig extends CodeConfigNode<CodeTypeName> {
  CodeTypeNameConfig(NodeBuildFunc<CodeTypeName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeTypeNameConfig.of(StringFunc func, Node child) =>
      CodeTypeNameConfig((context, name) {
        final mapperConfig =
            context.findAncestorNodeOfExactType<CodeTypeNameMapperConfig>();

        return TextTransform(name.name, (s) {
          s = func(s);
          return mapperConfig?.translate(s) ?? s;
        });
      }, child);

  factory CodeTypeNameConfig.forJavaLike(Node child) =>
      CodeTypeNameConfig.of(StringFuncs.pascal, child);
}

class CodeTypeName extends CodeConfigProxyNode<CodeTypeName>
    implements _NamedNode {
  @override
  final Node name;

  CodeTypeName._(this.name) : assert(name != null);

  static CodeTypeName _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeTypeName>(value, (v) {
      // Try to parse the value as the expression name.
      final name = _parseNameNode(v, error: error);
      if (name == null) return null;
      return CodeTypeName._(name);
    }, error: error);
  }

  factory CodeTypeName.of(dynamic value) {
    return CodeTypeName._parse(value, error: () {
      throw '${value} is not a valid type name.';
    });
  }
}
