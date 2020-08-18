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

class CodeField extends CodeConfigProxyNode<CodeField> implements _NamedNode {
  // The field name. This is required.
  @override
  final CodeFieldName name;

  final CodeAnnotationList annotations;

  // The field's comment.
  final CodeModifier modifier;

  // The field data type. This is required.
  final CodeType type;

  final CodeExpr init;

  final CodeComment comment;

  CodeField._({
    @required this.name,
    this.annotations,
    this.modifier,
    @required this.type,
    this.init,
    this.comment,
  });

  /// Try parse a dynamic value to an argument object.
  static CodeField _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeField>(value, (v) {
      final list = _toDynamicNodeList(v);

      if (list?.isNotEmpty != true || list.length > 3) {
        return null;
      }

      // Try to parse the input as the name expression.
      final name = CodeFieldName._parse(list[0]);
      // Don't accept null
      if (name == null) return null;

      final type =
          list.length > 1 ? CodeType._parse(list[1], error: error) : null;

      final init =
          list.length > 2 ? CodeExpr._parse(list[2], error: error) : null;

      return CodeField._(
        name: name,
        type: type,
        init: init,
      );
    }, error: error);
  }

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
    dynamic comment,
  }) {
    return CodeField._(
      name: CodeFieldName.of(
        name: name,
        override: override,
        isPrivate: private,
        isPublic: public,
        isProtected: protected,
        isInternal: internal,
        isStatic: static,
        isFinal: isFinal,
      ),
      annotations: CodeAnnotationList._parse(annotations, error: () {
        throw '$annotations is not a valid annotation list';
      }),
      modifier: CodeModifier(
        override: override,
        isPrivate: private,
        isPublic: public,
        isProtected: protected,
        isInternal: internal,
        static: static,
        isFinal: isFinal,
      ),
      type:
          CodeType._parse(type, error: () => '$type is not a valid data type.'),
      init: CodeExpr.of(init),
      comment: CodeComment.of(comment),
    );
  }
}
