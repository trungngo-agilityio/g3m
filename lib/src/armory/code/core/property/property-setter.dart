part of g3.armory;

class CodePropertySetterConfig extends CodeConfigNode<CodePropertySetter> {
  CodePropertySetterConfig(
      NodeBuildFunc<CodePropertySetter> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePropertySetterConfig.forDartLike(Node child) =>
      CodePropertySetterConfig._internal(child, overrideAsAnnotation: true);

  factory CodePropertySetterConfig.forJavaLike(Node child) =>
      CodePropertySetterConfig._internal(child);

  factory CodePropertySetterConfig._internal(
    Node child, {
    String setKeyword = 'set ',
    bool overrideAsAnnotation = false,
  }) {
    return CodePropertySetterConfig((context, setter) {
      // Gets out the parent property
      final property = context.findAncestorNodeOfExactType<CodeProperty>();
      final modifier = property?.modifier;

      final name = setter.name ?? property?.name;
      final type = setter.type ?? property?.type;

      final def = Container([
        '\n',
        setter.comment,
        setter.annotations,

        // In the case of dart language, override is an annotation.
        // For csharp, it is an modifier.
        overrideAsAnnotation == true && modifier?.override == true
            ? '@override'
            : null,

        modifier, ' ', setKeyword, name,
        '(', type, ' value', ')',
      ]);

      if (setter.body == null) {
        return CodeStatement.of(def);
      } else {
        return Container([
          def,
          Text.space(),
          setter.body,
        ]);
      }
    }, child);
  }
}

class CodePropertySetter extends CodeConfigProxyNode<CodePropertySetter> {
  /// The property name. This is optional in the case it is used
  /// outside of a property.
  final CodePropertyName name;

  /// The property data type.
  final CodeType type;

  /// The property setter comment.
  final CodeComment comment;

  /// The list of annotations applied to the setter function.
  final CodeAnnotationList annotations;

  /// The setter implementation.
  final CodeBlock body;

  CodePropertySetter({
    this.name,
    this.type,
    this.comment,
    this.annotations,
    this.body,
  });

  factory CodePropertySetter.of({
    String name,
    String type,
    String comment,
    List<CodeAnnotation> annotations,
    List<dynamic> body,
  }) =>
      CodePropertySetter(
        name: CodePropertyName.of(name),
        type: CodeType.simple(type),
        comment: comment != null ? CodeComment.of(comment) : null,
        annotations: CodeAnnotationList.of(annotations),
        body: CodeBlock.of(CodeStatementList.of(body)),
      );
}
