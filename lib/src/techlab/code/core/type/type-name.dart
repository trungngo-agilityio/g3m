part of g3.techlab;

class CodeTypeNameMapperConfig extends SingleChildNode {
  final Map<String, String> map;

  CodeTypeNameMapperConfig(Node child, this.map)
      : assert(map != null),
        super(child);

  factory CodeTypeNameMapperConfig.of(
    Node child, {
    String tDynamic,
    String tVoid,
    String tBool,
    String tChar,
    String tString,
    String tByte,
    String tShort,
    String tInteger,
    String tLong,
    String tFloat,
    String tDouble,
    Map<String, String> others,
  }) {
    final data = <String, String>{};

    if (tDynamic != null) data[CodeType._dynamic] = tDynamic;
    if (tVoid != null) data[CodeType._void] = tVoid;
    if (tBool != null) data[CodeType._bool] = tBool;
    if (tChar != null) data[CodeType._char] = tChar;
    if (tString != null) data[CodeType._string] = tString;
    if (tByte != null) data[CodeType._byte] = tByte;
    if (tShort != null) data[CodeType._short] = tShort;
    if (tInteger != null) data[CodeType._integer] = tInteger;
    if (tLong != null) data[CodeType._long] = tLong;
    if (tFloat != null) data[CodeType._float] = tFloat;
    if (tDouble != null) data[CodeType._double] = tDouble;
    if (others != null) data.addAll(others);

    return CodeTypeNameMapperConfig(child, data);
  }

  // FIXME: Remove this, makes it more simple
  factory CodeTypeNameMapperConfig.forGRpcTypeToDartLike(
    Node child, {
    String double = 'double',
    String float = 'float',
    String int32 = 'int',
    String int64 = 'int',
    String uint32 = 'int',
    String uint64 = 'double',
    String sint32 = 'int',
    String sint64 = 'double',
    String fixed32 = 'int',
    String fixed64 = 'double',
    String sfixed32 = 'int',
    String sfixed64 = 'double',
    String bool = 'bool',
    String string = 'String',
    String bytes = 'bytes',
  }) {
    final data = <String, String>{
      'double': double,
      'float': float,
      'int32': int32,
      'int64': int64,
      'uint32': uint32,
      'uint64': uint64,
      'sint32': sint32,
      'sint64': sint64,
      'fixed32': fixed32,
      'fixed64': fixed64,
      'sfixed32': sfixed32,
      'sfixed64': sfixed64,
      'bool': bool,
      'string': string,
      'bytes': bytes,
    };

    return CodeTypeNameMapperConfig(child, data);
  }

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
