part of g3.armory;

/// Provides configuration for how [CodeDataType] node will render.
///
/// Here are some useful predefined factory methods:
/// [CodeDataTypeConfig.forJavaLike], [CodeDataTypeConfig.forDartLike]
/// that might work for many existing programming languages.
///
class CodeDataTypeConfig extends CodeConfigNode<CodeDataType> {
  CodeDataTypeConfig(NodeBuildFunc<CodeDataType> buildFunc, Node child)
      : super(buildFunc, child);

  /// Creates a data type config just like java language.
  /// It will work for csharp, typescript and many others.
  factory CodeDataTypeConfig.forJavaLike(Node child) =>
      CodeDataTypeConfig._internal(child, false);

  /// Creates a data type config for dart language.
  ///
  factory CodeDataTypeConfig.forDartLike(Node child) =>
      CodeDataTypeConfig._internal(child, true);

  factory CodeDataTypeConfig._internal(Node child, bool isDart) =>
      CodeDataTypeConfig((context, codeDataType) {
        final params = codeDataType.params;
        final array = codeDataType.array;

        Node name = CodeClassName(codeDataType.name);
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

  static CodeDataTypeConfig of(BuildContext context) {
    return context.dependOnAncestorNodeOfExactType<CodeDataTypeConfig>();
  }
}

/// Defines how to make a data type reference.
///
/// Important: [CodeDataTypeConfig] is a required ancestor for this node.
///
class CodeDataType extends CodeConfigProxyNode<CodeDataType> {
  /// The data type name.
  final Node name;

  /// The list of generic params.
  final CodeGenericParamList params;

  /// True indicates that this is an array type.
  final bool array;

  CodeDataType(this.name, {this.params, this.array});

  factory CodeDataType.simple(String name) => CodeDataType(Text(name));

  factory CodeDataType.genericSingle(String name, String param) => CodeDataType(
        Text(name),
        params: CodeGenericParamList.single(param),
      );

  factory CodeDataType.genericList(String name, List<String> params) =>
      CodeDataType(
        Text(name),
        params: CodeGenericParamList.list(params),
      );

  factory CodeDataType.array(String name) => CodeDataType(
        Text(name),
        array: true,
      );

  factory CodeDataType.genericSingleArray(String name, String param) =>
      CodeDataType(
        Text(name),
        params: CodeGenericParamList.single(param),
        array: true,
      );

  factory CodeDataType.genericListArray(String name, List<String> params) =>
      CodeDataType(
        Text(name),
        params: CodeGenericParamList.list(params),
        array: true,
      );
}
