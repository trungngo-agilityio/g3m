part of g3.armory;

class CodeFieldConfig extends CodeConfigNode<CodeField> {
  CodeFieldConfig(NodeBuildFunc<CodeField> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldConfig.forDartLike(Node child) =>
      CodeFieldConfig._internal(child, overrideAsAnnotation: true);

  factory CodeFieldConfig.forJavaLike(Node child) =>
      CodeFieldConfig._internal(child);

  factory CodeFieldConfig._internal(
    Node child, {
    bool overrideAsAnnotation,
  }) =>
      CodeFieldConfig((context, field) {
        return Container([
          '\n',
          CodeExpr.open(
            Container([
              field.comment,
              field.annotations,
              // In the case of dart language, override is an annotation.
              // For csharp, it is an modifier.
              overrideAsAnnotation == true && field.modifier?.override == true
                  ? '@override\n'
                  : null,
              field.modifier,
              field.type,
              ' ',
              field.name,
              field.init != null ? Container([' = ', field.init]) : null,
            ]),
          )
        ]);
      }, child);
}

class CodeField extends CodeConfigProxyNode<CodeField> implements NamedNode {
  // The field name. This is required.
  @override
  final CodeFieldName name;

  final CodeAnnotationList annotations;

  // The field's comment.
  final CodeModifier modifier;

  // The field data type. This is required.
  final CodeType type;

  final CodeStatementList init;

  final CodeComment comment;

  CodeField({
    @required this.name,
    this.annotations,
    this.modifier,
    @required this.type,
    this.init,
    this.comment,
  });

  factory CodeField.of({
    dynamic name,
    dynamic annotations,
    bool override,
    bool private,
    bool public,
    bool protected,
    bool internal,
    bool abstract,
    bool static,
    bool isFinal,
    dynamic type,
    dynamic init,
    String comment,
  }) {
    var modifier = CodeModifier(
      override: override,
      private: private,
      public: public,
      protected: protected,
      internal: internal,
      static: static,
      isFinal: isFinal,
    );
    return CodeField(
      name: CodeFieldName.of(name, modifier: modifier),
      annotations: CodeAnnotationList.of(annotations),
      modifier: modifier,
      type:
          CodeType._parse(type, error: () => '$type is not a valid data type.'),
      init: CodeStatementList.of(init, closed: true),
      comment: CodeComment.of(comment),
    );
  }
}
