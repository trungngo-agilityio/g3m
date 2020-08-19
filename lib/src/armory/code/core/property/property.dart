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
        // Property getter
        Node getter = property.getter;

        // Property setter
        Node setter = property.setter;

        return Container([
          getter,
          // Adds a new line to separate getter and setter.
          getter != null && setter != null ? '\n' : null,
          setter,
        ]);
      }, child);
}

class CodeProperty extends CodeConfigProxyNode<CodeProperty>
    implements _NamedNode {
  /// The property name.
  @override
  final CodePropertyName name;

  /// The list of annotations for the property.
  final CodeAnnotationList annotations;

  /// The property modifier
  final CodeModifier modifier;

  /// The data type of the property
  final CodeType type;

  /// Get getter function for the property
  final CodePropertyGetter getter;

  /// Get setter function for the property
  final CodePropertySetter setter;

  /// The comment for the property
  final CodeComment comment;

  CodeProperty({
    @required this.name,
    this.annotations,
    this.modifier,
    @required this.type,
    this.getter,
    this.setter,
    this.comment,
  }) {
    assert(name != null, 'property name is required');
    assert(type != null, 'property type is required');
    assert(getter != null || setter != null,
        'either setter or getter must be specified for property.');
  }

  factory CodeProperty.of({
    @required dynamic name,
    dynamic annotations,
    bool isOverride,
    bool isPrivate,
    bool isPublic,
    bool isProtected,
    bool isInternal,
    bool isAbstract,
    dynamic type,
    dynamic getter,
    dynamic setter,
    dynamic comment,
  }) {
    return CodeProperty(
      name: CodePropertyName.of(name),
      annotations: CodeAnnotationList.of(annotations),
      modifier: CodeModifier(
        override: isOverride,
        isPrivate: isPrivate,
        isPublic: isPublic,
        isProtected: isProtected,
        isInternal: isInternal,
        isAbstract: isAbstract,
      ),
      type: CodeType._parse(type, error: () {
        throw '$type is not a valid type.';
      }),
      getter: CodePropertyGetter._parse(getter, error: () {
        throw 'Invalid $getter found.';
      }),
      setter: CodePropertySetter._parse(setter, error: () {
        throw 'Invalid $setter found.';
      }),
      comment: CodeComment.of(comment),
    );
  }
}
