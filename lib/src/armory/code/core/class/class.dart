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
          Trim.leftRight(
            Container([
              clazz.access,
              Text.space(),
              Text(classKeyword),
              Text.space(),
              clazz.name,
              clazz.generic,
              Text.space(),
              clazz.extend,
              Text.space(),
              clazz.implements,
            ]),
          ),
          Text.space(),
          CodeBlock(Container([
            clazz.fields,
            clazz.functions,
          ])),
        ]);
      }, child);
}

class CodeClass extends CodeConfigProxyNode<CodeClass> {
  /// The class name.
  final CodeClassName name;

  final CodeAccess access;

  final CodeGenericParamList generic;

  final CodeClassExtendList extend;

  final CodeClassImplementList implements;

  /// The list of fields defined in the class.
  final CodeFieldList fields;

  /// THe list of functions defined in the class.
  final CodeFunctionList functions;

  final CodeComment comment;

  CodeClass({
    @required this.name,
    this.access,
    this.generic,
    this.extend,
    this.implements,
    this.fields,
    this.functions,
    this.comment,
  });

  factory CodeClass.of({
    String name,
    CodeAccess access,
    CodeGenericParamList generic,
    CodeClassExtendList extend,
    CodeClassImplementList implements,
    CodeFieldList fields,
    CodeFunctionList functions,
    String comment,
  }) =>
      CodeClass(
        name: CodeClassName.simple(name),
        generic: generic,
        access: access,
        extend: extend,
        implements: implements,
        fields: fields,
        functions: functions,
        comment: comment != null ? CodeComment.text(comment) : null,
      );
}
