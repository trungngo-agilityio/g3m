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
      CodeTypeConfig._internal(child, false, mapper);

  /// Creates a data type config for dart language.
  ///
  factory CodeTypeConfig.forDartLike(Node child, {StringFunc mapper}) =>
      CodeTypeConfig._internal(child, true, mapper);

  factory CodeTypeConfig._internal(
          Node child, bool isDart, StringFunc mapper) =>
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
          if (isDart == true) {
            // Dart has syntax for array (or immutable list) as
            // List<T> as a example.
            name = Pad.of('List<', '>', name);
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

  factory CodeType.ofVoid() => CodeType.simple('void');

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
