part of g3.armory;

class CodeClassConfig extends CodeConfigNode<CodeClass> {
  CodeClassConfig(NodeBuildFunc<CodeClass> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConfig.forJavaLike(
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
  final CodeName name;

  /// Defines public, private, protected, etc.
  final CodeAccess access;

  /// The list of generic param applied for the class.
  final CodeGenericParamList generic;

  /// The list of data types that this class extends from.
  final CodeClassExtendList extend;

  /// The list of data types that this class implements.
  final CodeClassImplementList implements;

  /// The list of fields defined in the class.
  final CodeFieldList fields;

  /// THe list of functions defined in the class.
  final CodeFunctionList functions;

  /// Class-level code comment.
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
  }) : assert(name != null);

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
        name: CodeName.of(name),
        generic: generic,
        access: access,
        extend: extend,
        implements: implements,
        fields: fields,
        functions: functions,
        comment: comment != null ? CodeComment.text(comment) : null,
      );
}
