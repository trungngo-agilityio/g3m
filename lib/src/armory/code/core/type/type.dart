part of g3.armory;

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
  factory CodeTypeConfig.forJavaLike(Node child) =>
      CodeTypeConfig._internal(child, false);

  /// Creates a data type config for dart language.
  ///
  factory CodeTypeConfig.forDartLike(Node child) =>
      CodeTypeConfig._internal(child, true);

  factory CodeTypeConfig._internal(Node child, bool isDart) =>
      CodeTypeConfig((context, type) {
        final params = type.generic;
        final array = type.array;

        Node name = type.name;
        if (array != true && (params == null || params.params.isEmpty)) {
          // If there is no complex settings, just return the
          // type name.
          return name;
        }

        if (params != null) {
          // Append generic params after the type.
          name = Container([
            name,
            params,
          ]);
        }

        if (array == true) {
          if (isDart) {
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
class CodeType extends CodeConfigProxyNode<CodeType> {
  /// The data type name.
  final CodeTypeName name;

  /// The list of generic params.
  final CodeGenericParamList generic;

  /// True indicates that this is an array type.
  final bool array;

  CodeType(this.name, {this.generic, this.array});

  factory CodeType.simple(String name) => CodeType(CodeTypeName.of(name));

  factory CodeType.genericSingle(String name, CodeGenericParam param) =>
      CodeType(
        CodeTypeName.of(name),
        generic: CodeGenericParamList.of([param]),
      );

  factory CodeType.genericList(String name, List<String> params) => CodeType(
        CodeTypeName.of(name),
        generic: CodeGenericParamList.of(
            params?.map((e) => CodeGenericParam.of(e))?.toList()),
      );

  factory CodeType.array(String name) => CodeType(
        CodeTypeName.of(name),
        array: true,
      );

  factory CodeType.genericSingleArray(String name, String param) => CodeType(
        CodeTypeName.of(name),
        generic: CodeGenericParamList.of([CodeGenericParam.of(param)]),
        array: true,
      );

  factory CodeType.genericListArray(String name, List<String> params) =>
      CodeType(
        CodeTypeName.of(name),
        generic: CodeGenericParamList.of(
            params?.map((e) => CodeGenericParam.of(e))?.toList()),
        array: true,
      );
}
