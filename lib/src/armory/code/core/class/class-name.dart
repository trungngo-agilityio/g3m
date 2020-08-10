part of g3.armory;

class CodeClassNameConfig extends CodeConfigNode<CodeClassName> {
  CodeClassNameConfig(NodeBuildFunc<CodeClassName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassNameConfig.pascalCase(Node child) =>
      CodeClassNameConfig((context, fieldName) {
        return PascalCase(fieldName.name);
      }, child);

  factory CodeClassNameConfig.camelCase(Node child) =>
      CodeClassNameConfig((context, fieldName) {
        return CamelCase(fieldName.name);
      }, child);

  factory CodeClassNameConfig.snakeCase(Node child) =>
      CodeClassNameConfig((context, fieldName) {
        return SnakeCase(fieldName.name);
      }, child);
}

class CodeClassName extends CodeConfigProxyNode<CodeClassName> {
  final Node name;

  CodeClassName(this.name);

  factory CodeClassName.simple(String name) => CodeClassName(Text(name));
}
