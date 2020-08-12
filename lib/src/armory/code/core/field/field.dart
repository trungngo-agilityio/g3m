part of g3.armory;

class CodeFieldConfig extends CodeConfigNode<CodeField> {
  CodeFieldConfig(NodeBuildFunc<CodeField> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldConfig.typeThenName(Node child) =>
      CodeFieldConfig((context, field) {
        return CodeStatement(Container([
          field.comment,
          field.type,
          Text.space(),
          field.name,
        ]));
      }, child);

  factory CodeFieldConfig.nameThenType(Node child) =>
      CodeFieldConfig((context, field) {
        return CodeStatement(Container([
          field.comment,
          field.name,
          Text.space(),
          field.type,
        ]));
      }, child);
}

class CodeField extends CodeConfigProxyNode<CodeField> {
  final CodeFieldName name;
  final CodeType type;
  final CodeComment comment;

  CodeField({
    this.name,
    this.type,
    this.comment,
  });

  factory CodeField.of({String name, String type, String comment}) => CodeField(
        name: CodeFieldName.of(name),
        type: CodeType.simple(type),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
