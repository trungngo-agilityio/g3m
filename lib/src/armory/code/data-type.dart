part of g3.armory;

/// Defines different access level for a piece of code. For example,
/// a class method can be either public, private, or protected.
///
enum CodeAccess { public, private, protected }

class CodeDataTypeConfig extends CodeConfigNode<CodeDataType> {
  CodeDataTypeConfig(NodeBuildFunc<CodeDataType> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeDataTypeConfig.javaLike(Node child) =>
      CodeDataTypeConfig._internal(child, false);

  factory CodeDataTypeConfig.dartLike(Node child) =>
      CodeDataTypeConfig._internal(child, true);

  factory CodeDataTypeConfig._internal(Node child, bool isDart) =>
      CodeDataTypeConfig((context, codeDataType) {
        final params = codeDataType.params;
        final array = codeDataType.array;

        Node name = PascalCase(codeDataType.name);
        if (array == true && params == null) {
          return name;
        }

        if (params != null) {
          name = Container([name, params]);
        }

        if (array == true) {
          if (isDart) {
            name = Container([Text('List<'), name, Text('>')]);
          } else {
            name = Container([name, Text('[]')]);
          }
        }
        return name;
      }, child);

  static CodeDataTypeConfig of(BuildContext context) {
    return context.dependOnAncestorNodeOfExactType<CodeDataTypeConfig>();
  }
}

class CodeDataType extends CodeConfigProxyNode<CodeDataType> {
  final Node name;
  final CodeGenericParamList params;
  final bool array;

  CodeDataType(this.name, {this.params, this.array});

  factory CodeDataType.simple(Node name) => CodeDataType(name);

  factory CodeDataType.generic(Node name, CodeGenericParamList params) =>
      CodeDataType(name, params: params);

  factory CodeDataType.array(Node name) => CodeDataType(name, array: true);

  factory CodeDataType.genericArray(Node name, CodeGenericParamList params) =>
      CodeDataType(name, params: params, array: true);
}
