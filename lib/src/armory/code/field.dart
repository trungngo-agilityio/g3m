part of g3.armory;

class CodeFieldConfig extends CodeConfigNode<CodeField> {
  CodeFieldConfig(NodeBuildFunc<CodeField> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldConfig.typeThenName(Node child) =>
      CodeFieldConfig((context, field) {
        return CodeStatement(Container([field.type, Text.space(), field.name]));
      }, child);

  factory CodeFieldConfig.nameThenType(Node child) =>
      CodeFieldConfig((context, field) {
        return CodeStatement(Container([field.name, Text.space(), field.type]));
      }, child);
}

class CodeField extends CodeConfigProxyNode<CodeField> {
  final CodeDataType type;
  final CodeFieldName name;

  CodeField(this.type, this.name);

  factory CodeField.simple(String type, String name) =>
      CodeField(CodeDataType.simple(type), CodeFieldName.simple(name));
}
