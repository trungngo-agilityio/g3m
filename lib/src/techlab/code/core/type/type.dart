part of g3.techlab;

/// Provides configuration for how [CodeType] node will render.
///
/// Here are some useful predefined factory methods:
/// [CodeTypeConfig.forJavaLike], [CodeTypeConfig.forDartLike]
/// that might work for many existing programming languages.
///
class CodeTypeConfig extends CodeConfigNode<CodeType> {
  CodeTypeConfig(NodeBuildFunc<CodeType> buildFunc, Node child)
      : super(buildFunc, child);

  /// Creates a data type config just like java language.
  /// It will work for csharp, typescript and many others.
  factory CodeTypeConfig.forJavaLike(Node child, {StringFunc mapper}) =>
      CodeTypeConfig._internal(child, null, mapper);

  /// Creates a data type config for dart language.
  ///
  factory CodeTypeConfig.forDartLike(Node child, {StringFunc mapper}) =>
      CodeTypeConfig._internal(child, 'List', mapper);

  factory CodeTypeConfig.forKotlinLike(Node child, {StringFunc mapper}) =>
      CodeTypeConfig._internal(child, 'Array', mapper);

  factory CodeTypeConfig._internal(
          Node child, String arrayClassName, StringFunc mapper) =>
      CodeTypeConfig((context, type) {
        final params = type.generic;
        final array = type.array;

        Node name = type.name;
        if (type.instance != null) {
          name = Container([type.instance, '.', name]);
        }

        if (array != true && (params == null || params.params.isEmpty)) {
          // If there is no complex settings, just return the
          // type name.
          return name;
        }

        if (mapper != null) {
          name = TextTransform(name, mapper);
        }

        if (params != null) {
          // Append generic params after the type.
          name = Container([
            name,
            params,
          ]);
        }

        if (array == true) {
          if (arrayClassName != null) {
            // Dart has syntax for array (or immutable list) as
            // List<T> as a example.
            name = Pad.of(arrayClassName + '<', '>', name);
          } else {
            // Other language often like T[].
            name = Pad.right('[]', name);
          }
        }
        return name;
      }, child);

  static CodeTypeConfig of(BuildContext context) {
    return context.dependOnAncestorNodeOfExactType<CodeTypeConfig>();
  }
}

/// Defines how to make a data type reference.
///
/// Important: [CodeTypeConfig] is a required ancestor for this node.
///
class CodeType extends CodeConfigProxyNode<CodeType> implements _NamedNode {
  /// The data type name.
  @override
  final CodeTypeName name;

  final CodeRef instance;

  /// The list of generic params.
  final CodeGenericParamList generic;

  /// True indicates that this is an array type.
  final bool array;

  CodeType._({this.instance, this.name, this.generic, this.array});

  static CodeType _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeType>(value, (v) {
      var name = CodeTypeName._parse(v);
      if (name != null) {
        return CodeType._(name: name);
      }

      return null;
    }, error: error);
  }

  factory CodeType.of({
    dynamic instance,
    @required dynamic name,
    dynamic generic,
    bool array,
  }) {
    if (name == null && generic == null && array == null) {
      return null;
    }

    return CodeType._(
      instance: CodeRef.of(instance),
      name: CodeTypeName.of(name),
      generic: CodeGenericParamList.of(generic),
      array: array,
    );
  }

  // ---------------------------------------------------------------------------
  // Basic Types
  // See: https://developers.google.com/protocol-buffers/docs/proto3#scalar
  // ---------------------------------------------------------------------------

  static const _list = 'list';

  // --- Dynamic Type

  static const _dynamic = 'dynamic';

  factory CodeType.ofDynamic() => CodeType.simple(_dynamic);

  factory CodeType.ofDynamicArray() => CodeType.array(_dynamic);

  factory CodeType.ofDynamicList() => CodeType.list(_dynamic);

  // --- Void Type

  static const _void = 'void';

  factory CodeType.ofVoid() => CodeType.simple(_void);

  // --- Bool Type

  static const _bool = 'bool';

  factory CodeType.ofBool() => CodeType.simple(_bool);

  factory CodeType.ofBoolArray() => CodeType.array(_bool);

  factory CodeType.ofBoolList() => CodeType.list(_bool);

  // --- Char Type

  static const _char = 'char';

  factory CodeType.ofChar() => CodeType.simple(_char);

  factory CodeType.ofCharArray() => CodeType.array(_char);

  factory CodeType.ofCharList() => CodeType.list(_char);

  // --- String Type

  static const _string = 'string';

  factory CodeType.ofString() => CodeType.simple(_string);

  factory CodeType.ofStringArray() => CodeType.array(_string);

  factory CodeType.ofStringList() => CodeType.list(_string);

  // --- Byte Type

  static const _byte = 'byte';

  factory CodeType.ofByte() => CodeType.simple(_byte);

  factory CodeType.ofByteArray() => CodeType.array(_byte);

  factory CodeType.ofByteList() => CodeType.list(_byte);

  // --- Short Type

  static const _short = 'short';

  factory CodeType.ofShort() => CodeType.simple(_short);

  factory CodeType.ofShortArray() => CodeType.array(_short);

  factory CodeType.ofShortList() => CodeType.list(_short);

  // --- Integer Type

  static const _integer = 'integer';

  factory CodeType.ofInteger() => CodeType.simple(_integer);

  factory CodeType.ofIntegerArray() => CodeType.array(_integer);

  factory CodeType.ofIntegerList() => CodeType.list(_integer);

  // --- Long Type

  static const _long = 'long';

  factory CodeType.ofLong() => CodeType.simple(_long);

  factory CodeType.ofLongArray() => CodeType.array(_long);

  factory CodeType.ofLongList() => CodeType.list(_long);

  // --- Float Type

  static const _float = 'float';

  factory CodeType.ofFloat() => CodeType.simple(_float);

  factory CodeType.ofFloatArray() => CodeType.array(_float);

  factory CodeType.ofFloatList() => CodeType.list(_float);

  // --- Double Type

  static const _double = 'double';

  factory CodeType.ofDouble() => CodeType.simple(_double);

  factory CodeType.ofDoubleArray() => CodeType.array(_double);

  factory CodeType.ofDoubleList() => CodeType.list(_double);

  // ---------------------------------------------------------------------------
  // Utilities
  // ---------------------------------------------------------------------------

  factory CodeType.simple(String name) => CodeType.of(
        name: CodeTypeName.of(name),
      );

  factory CodeType.genericSingle(String name, String param) => CodeType.of(
        name: CodeTypeName.of(name),
        generic: CodeGenericParamList.of(
          [CodeGenericParam.of(name: param)],
        ),
      );

  factory CodeType.genericList(String name, List<String> params) => CodeType.of(
        name: CodeTypeName.of(name),
        generic: CodeGenericParamList.of(
            params?.map((e) => CodeGenericParam.of(name: e))?.toList()),
      );

  factory CodeType.array(String name) => CodeType.of(
        name: CodeTypeName.of(name),
        array: true,
      );

  factory CodeType.list(String name) => CodeType.genericSingle(
        _list,
        name,
      );

  factory CodeType.genericSingleArray(String name, String param) => CodeType.of(
        name: CodeTypeName.of(name),
        generic: CodeGenericParamList.of([CodeGenericParam.of(name: param)]),
        array: true,
      );

  factory CodeType.genericListArray(String name, List<String> params) =>
      CodeType.of(
        name: CodeTypeName.of(name),
        generic: CodeGenericParamList.of(
            params?.map((e) => CodeGenericParam.of(name: e))?.toList()),
        array: true,
      );
}
