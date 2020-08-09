part of g3.armory;

/// Defines different access level for a piece of code. For example,
/// a class method can be either public, private, or protected.
///
enum CodeAccess { public, private, protected }

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
        if (array == true && params == null) {
          // If there is no complex settings, just return the
          // type name.
          return name;
        }

        if (params != null) {
          // Append generic params after the type.
          name = Container([name, params]);
        }

        if (array == true) {
          if (isDart) {
            // Dart has syntax for array (or immutable list) as
            // List<T> as a example.
            name = Container([Text('List<'), name, Text('>')]);
          } else {
            // Other language often like T[].
            name = Container([name, Text('[]')]);
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

  factory CodeDataType.simple(Node name) => CodeDataType(name);

  factory CodeDataType.generic(Node name, CodeGenericParamList params) =>
      CodeDataType(name, params: params);

  factory CodeDataType.array(Node name) => CodeDataType(name, array: true);

  factory CodeDataType.genericArray(Node name, CodeGenericParamList params) =>
      CodeDataType(name, params: params, array: true);
}
