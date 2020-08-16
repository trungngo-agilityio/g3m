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
          CodeStatement.of(
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

class CodeField extends CodeConfigProxyNode<CodeField> {
  final CodeFieldName name;
  final CodeAnnotationList annotations;
  final CodeModifier modifier;
  final CodeType type;
  final CodeExpr init;
  final CodeComment comment;

  CodeField({
    this.name,
    this.annotations,
    this.modifier,
    this.type,
    this.init,
    this.comment,
  });

  factory CodeField.of({
    String name,
    List<CodeAnnotation> annotations,
    bool override,
    bool private,
    bool public,
    bool protected,
    bool internal,
    bool abstract,
    bool static,
    bool isFinal,
    String type,
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
      type: CodeType.simple(type),
      init: init != null ? CodeExpr.of(init) : null,
      comment: comment != null ? CodeComment.of(comment) : null,
    );
  }
}
