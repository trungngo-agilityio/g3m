part of g3.armory;

class CodePropertyConfig extends CodeConfigNode<CodeProperty> {
  CodePropertyConfig(NodeBuildFunc<CodeProperty> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePropertyConfig.forDartLike(Node child) =>
      CodePropertyConfig._internal(child, overrideAsAnnotation: true);

  factory CodePropertyConfig.forJavaLike(Node child) =>
      CodePropertyConfig._internal(child);

  factory CodePropertyConfig._internal(
    Node child, {
    bool overrideAsAnnotation,
    bool generateFieldIfNoSetterAndGetter = true,
  }) =>
      CodePropertyConfig((context, property) {
        // The data field representing the property.
        Node field;

        // Property getter
        Node getter = property.getter;
        if (getter != null) {
          // Adds an extra new line before the getter definition
          getter = Pad.left('\n', getter);
        }

        // Property setter
        Node setter = property.setter;
        if (setter != null) {
          // Adds an extra new line before the setter definition
          setter = Pad.left('\n', setter);
        }

        if (getter == null &&
            setter == null &&
            generateFieldIfNoSetterAndGetter) {
          field = Container([
            property.comment,
            property.modifier,
            property.annotations,
            // In the case of dart language, override is an annotation.
            // For csharp, it is an modifier.
            overrideAsAnnotation == true && property.modifier?.override == true
                ? '@override'
                : null,
            property.type,
            ' ',
            property.name,
            property.init != null ? Container([' = ', property.init]) : null,
          ]);

          // Adds an extra new line before the field definition
          field = CodeStatement.of(Pad.left('\n', field));
        }
        return Container([
          field,
          getter,
          setter,
        ]);
      }, child);
}

class CodeProperty extends CodeConfigProxyNode<CodeProperty> {
  /// The property name.
  final CodePropertyName name;

  /// The list of annotations for the property.
  final CodeAnnotationList annotations;

  /// The property modifier
  final CodeModifier modifier;

  /// The data type of the property
  final CodeType type;

  /// The property initializer
  final CodeExpr init;

  /// Get getter function for the property
  final CodePropertyGetter getter;

  /// Get setter function for the property
  final CodePropertySetter setter;

  /// The comment for the property
  final CodeComment comment;

  CodeProperty({
    this.name,
    this.annotations,
    this.modifier,
    this.type,
    this.init,
    this.getter,
    this.setter,
    this.comment,
  });

  factory CodeProperty.of({
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
    CodePropertyGetter getter,
    CodePropertySetter setter,
    dynamic init,
    String comment,
  }) =>
      CodeProperty(
        name: CodePropertyName.of(name),
        annotations: CodeAnnotationList.of(annotations),
        modifier: CodeModifier(
          override: override,
          private: private,
          public: public,
          protected: protected,
          internal: internal,
          static: static,
          isFinal: isFinal,
        ),
        type: CodeType.simple(type),
        init: init != null ? CodeExpr.of(init) : null,
        getter: getter,
        setter: setter,
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}