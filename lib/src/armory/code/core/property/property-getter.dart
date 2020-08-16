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
      final property = context.findAncestorNodeOfExactType<CodeProperty>();
      final modifier = property?.modifier;

      final name = getter.name ?? property?.name;
      final type = getter.type ?? property?.type;

      final def = Container([
        '\n',
        getter.comment,
        getter.annotations,

        // In the case of dart language, override is an annotation.
        // For csharp, it is an modifier.
        overrideAsAnnotation == true && modifier?.override == true
            ? '@override'
            : null,

        modifier,
        type,
        ' ',
        getKeyword,
        name,
      ]);

      if (getter.body == null) {
        return CodeStatement.of(def);
      } else {
        return Container([
          def,
          Text.space(),
          getter.body,
        ]);
      }
    }, child);
  }
}

class CodePropertyGetter extends CodeConfigProxyNode<CodePropertyGetter> {
  /// The property name.
  final CodePropertyName name;

  /// The property data type.
  final CodeType type;

  /// The comment for this getter.
  final CodeComment comment;

  /// The list of annotations applied to this getter.
  final CodeAnnotationList annotations;

  /// The getter implementation.
  final CodeBlock body;

  CodePropertyGetter({
    this.name,
    this.type,
    this.comment,
    this.annotations,
    this.body,
  });

  factory CodePropertyGetter.of({
    String name,
    String type,
    String comment,
    List<CodeAnnotation> annotations,
    List<dynamic> body,
  }) =>
      CodePropertyGetter(
        name: CodePropertyName.of(name),
        type: CodeType.simple(type),
        comment: comment != null ? CodeComment.of(comment) : null,
        annotations: CodeAnnotationList.of(annotations),
        body: CodeBlock.of(CodeStatementList.of(body)),
      );
}
