part of g3.armory;

class CodeFieldConfig extends CodeConfigNode<CodeField> {
  CodeFieldConfig(NodeBuildFunc<CodeField> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldConfig.forJavaLike(Node child) =>
      CodeFieldConfig((context, field) {
        return Container([
          '\n',
          CodeStatement.of(
            Container([
              field.comment,
              field.type,
              ' ',
              field.name,
              field.init != null ? Container([' = ', field.init]) : null,
            ]),
          )
        ]);
      }, child);
}

class CodeField extends CodeConfigProxyNode<CodeField> {
  final CodeFieldName name;
  final CodeType type;
  final CodeExpr init;
  final CodeComment comment;

  CodeField({
    this.name,
    this.type,
    this.init,
    this.comment,
  });

  factory CodeField.of(
          {String name, String type, dynamic init, String comment}) =>
      CodeField(
        name: CodeFieldName.of(name),
        type: CodeType.simple(type),
        init: init != null ? CodeExpr.of(init) : null,
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
