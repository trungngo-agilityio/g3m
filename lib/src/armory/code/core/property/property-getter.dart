part of g3.armory;

class CodePropertyGetterConfig extends CodeConfigNode<CodePropertyGetter> {
  CodePropertyGetterConfig(
      NodeBuildFunc<CodePropertyGetter> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePropertyGetterConfig.forDartLike(Node child) =>
      CodePropertyGetterConfig._internal(child, overrideAsAnnotation: true);

  factory CodePropertyGetterConfig.forJavaLike(Node child) =>
      CodePropertyGetterConfig._internal(
        child,
      );

  factory CodePropertyGetterConfig._internal(
    Node child, {
    String getKeyword = 'get ',
    bool overrideAsAnnotation = false,
  }) {
    return CodePropertyGetterConfig((context, getter) {
      // Gets out the parent property
      final property = context.dependOnAncestorNodeOfExactType<CodeProperty>();
      final modifier = property.modifier;
      final name = property.name;
      final type = property.type;

      final def = Container([
        '\n',
        getter.comment,
        getter.annotations,

        // In the case of dart language, override is an annotation.
        // For csharp, it is an modifier.
        overrideAsAnnotation == true && modifier?.isOverride == true
            ? '@override\n'
            : null,

        modifier,
        type,
        ' ',
        getKeyword,
        name,
      ]);

      if (getter.body == null) {
        return CodeExpr.open(def);
      } else {
        return CodeExpr.closed(
          Container([
            def,
            Text.space(),
            getter.body,
          ]),
        );
      }
    }, child);
  }
}

class CodePropertyGetter extends CodeConfigProxyNode<CodePropertyGetter> {
  /// The comment for this getter.
  final CodeComment comment;

  /// The list of annotations applied to this getter.
  final CodeAnnotationList annotations;

  /// The getter implementation.
  final CodeBlock body;

  CodePropertyGetter._({
    this.comment,
    this.annotations,
    @required this.body,
  }) : assert(body != null, 'property body is required');

  factory CodePropertyGetter._parse(
    dynamic value, {
    _NodeParseErrorFunc error,
  }) {
    return _parseNode<CodePropertyGetter>(value, (v) {
      final statements = CodeStatementList._parse(v);
      return CodePropertyGetter._(
        body: CodeBlock.of(statements),
      );
    }, error: error);
  }

  factory CodePropertyGetter.of({
    @required dynamic body,
    dynamic annotations,
    dynamic comment,
  }) =>
      CodePropertyGetter._(
        comment: CodeComment.of(comment),
        annotations: CodeAnnotationList.of(annotations),
        body: CodeBlock.of(CodeStatementList.of(body)),
      );
}
