part of g3.armory;

class CodeClassConfig extends CodeConfigNode<CodeClass> {
  CodeClassConfig(NodeBuildFunc<CodeClass> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConfig.of(
    Node child, {
    String classKeyword = 'class',
    String extendsKeyword = 'extends',
    String implementsKeyword = 'implements',
  }) =>
      CodeClassConfig((context, clazz) {
        return Container([
          clazz.comment,
          Text(classKeyword),
          Text.space(),
          clazz.name,
          clazz.implement == null
              ? null
              : Container([
                  Text(implementsKeyword),
                  Container(clazz.implement),
                ]),
          Text.space(),
          CodeBlock(Container([
            Container(clazz.fields),
            Container(clazz.functions),
          ])),
        ]);
      }, child);
}

class CodeClass extends CodeConfigProxyNode<CodeClass> {
  /// The class name.
  final CodeClassName name;
  final bool abstract;
  final bool interface;

  /// The access level for the class.
  final CodeAccess access;

  /// The list of fields defined in the class.
  final List<CodeField> fields;

  /// THe list of functions defined in the class.
  final List<CodeFunction> functions;

  final CodeDataType extend;
  final List<CodeDataType> implement;
  final List<CodeAnnotation> annotations;
  final CodeComment comment;

  CodeClass(
    this.name, {
    this.abstract,
    this.interface,
    this.access,
    this.fields,
    this.functions,
    this.extend,
    this.implement,
    this.annotations,
    this.comment,
  });
}
