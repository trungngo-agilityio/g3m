part of g3.armory;

class CodeFieldConfig extends CodeConfigNode<CodeField> {
  CodeFieldConfig(NodeBuildFunc<CodeField> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldConfig.forDartLike(Node child) => CodeFieldConfig._internal(
        child,
        typeFirst: true,
        typeNameSeparator: ' ',
        overrideAsAnnotation: true,
      );

  factory CodeFieldConfig.forJavaLike(Node child) => CodeFieldConfig._internal(
        child,
        typeFirst: true,
        typeNameSeparator: ' ',
      );

  factory CodeFieldConfig.forTypescriptLike(Node child) =>
      CodeFieldConfig._internal(
        child,
        typeFirst: false,
        typeNameSeparator: ': ',
        optionalSuffix: '?',
      );

  factory CodeFieldConfig._internal(
    Node child, {
    @required bool typeFirst,
    @required String typeNameSeparator,
    String optionalSuffix,
    bool overrideAsAnnotation,
  }) =>
      CodeFieldConfig((context, field) {
        final modifier = field.modifier;

        Node s1 = field.name;
        Node s2 = field.type;

        if (modifier.isOptional == true && optionalSuffix?.isNotEmpty == true) {
          s1 = Pad.right(optionalSuffix, s1, onlyIfMissing: true);
        }

        if (typeFirst == true) {
          var tmp = s1;
          s1 = s2;
          s2 = tmp;
        }

        return Container([
          '\n',
          CodeExpr.open(
            Container([
              field.comment,
              field.annotations,
              // In the case of dart language, override is an annotation.
              // For csharp, it is an modifier.
              overrideAsAnnotation == true && modifier?.isOverride == true
                  ? '@override\n'
                  : null,
              modifier,
              s1,
              typeNameSeparator,
              s2,
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
    bool isOverride,
    bool isPrivate,
    bool isPublic,
    bool isProtected,
    bool isInternal,
    bool isAbstract,
    bool isStatic,
    bool isFinal,
    bool isOptional,
    dynamic type,
    dynamic init,
    dynamic comment,
  }) {
    return CodeField._(
      name: CodeFieldName.of(
        name: name,
        isOverride: isOverride,
        isPrivate: isPrivate,
        isPublic: isPublic,
        isProtected: isProtected,
        isInternal: isInternal,
        isStatic: isStatic,
        isFinal: isFinal,
      ),
      annotations: CodeAnnotationList._parse(annotations, error: () {
        throw '$annotations is not a valid annotation list';
      }),
      modifier: CodeModifier(
        isOverride: isOverride,
        isPrivate: isPrivate,
        isPublic: isPublic,
        isProtected: isProtected,
        isInternal: isInternal,
        isStatic: isStatic,
        isFinal: isFinal,
        isOptional: isOptional,
      ),
      type:
          CodeType._parse(type, error: () => '$type is not a valid data type.'),
      init: CodeExpr.of(init),
      comment: CodeComment.of(comment),
    );
  }
}
