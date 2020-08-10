part of g3.armory;

class CodeFieldNameConfig extends CodeConfigNode<CodeFieldName> {
  CodeFieldNameConfig(NodeBuildFunc<CodeFieldName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldNameConfig.pascalCase(Node child) =>
      CodeFieldNameConfig((context, fieldName) {
        return PascalCase(fieldName.name);
      }, child);

  factory CodeFieldNameConfig.camelCase(Node child) =>
      CodeFieldNameConfig((context, fieldName) {
        return CamelCase(fieldName.name);
      }, child);

  factory CodeFieldNameConfig.snakeCase(Node child) =>
      CodeFieldNameConfig((context, fieldName) {
        return SnakeCase(fieldName.name);
      }, child);
}

class CodeFieldName extends CodeConfigProxyNode<CodeFieldName> {
  final Node name;

  CodeFieldName(this.name);

  factory CodeFieldName.simple(String name) => CodeFieldName(Text(name));
}
