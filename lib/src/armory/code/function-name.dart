part of g3.armory;

class CodeFunctionNameConfig extends CodeConfigNode<CodeFunctionName> {
  CodeFunctionNameConfig(NodeBuildFunc<CodeFunctionName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionNameConfig.pascalCase(Node child) =>
      CodeFunctionNameConfig((context, fieldName) {
        return PascalCase(fieldName.name);
      }, child);

  factory CodeFunctionNameConfig.camelCase(Node child) =>
      CodeFunctionNameConfig((context, fieldName) {
        return CamelCase(fieldName.name);
      }, child);

  factory CodeFunctionNameConfig.snakeCase(Node child) =>
      CodeFunctionNameConfig((context, fieldName) {
        return SnakeCase(fieldName.name);
      }, child);
}

class CodeFunctionName extends CodeConfigProxyNode<CodeFunctionName> {
  final Node name;

  CodeFunctionName(this.name);

  factory CodeFunctionName.of(String name) => CodeFunctionName(Text(name));
}
