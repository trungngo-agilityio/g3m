part of g3.techlab;

class CodeClassConfig extends CodeConfigNode<CodeClass> {
  CodeClassConfig(NodeBuildFunc<CodeClass> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConfig.forJavaLike(
    Node child, {
    String classKeyword = 'class ',
    String extendsKeyword = 'extends ',
    String implementsKeyword = 'implements ',
    String withKeyword = 'with ',
  }) =>
      CodeClassConfig((context, clazz) {
        return Container([
          '\n',
          clazz.comment,
          clazz.annotations,
          Trim.leftRight(
            Container([
              clazz.modifier,
              classKeyword,
              clazz.name,
              clazz.generic,
              ' ',
              clazz.extend != null
                  ? Container([
                      extendsKeyword,
                      clazz.extend,
                    ])
                  : null,
              clazz.implements != null
                  ? Container([
                      ' ',
                      implementsKeyword,
                      clazz.implements,
                    ])
                  : null,
              clazz.mixins != null
                  ? Container([
                      ' ',
                      withKeyword,
                      clazz.mixins,
                    ])
                  : null,
            ]),
          ),
          ' ',
          clazz.body,
          '\n',
        ]);
      }, child);
}

class CodeClass extends CodeConfigProxyNode<CodeClass> implements _NamedNode {
  /// The class name.
  @override
  final CodeClassName name;

  /// Defines public, private, protected, etc.
  final CodeModifier modifier;

  /// The list of generic param applied for the class.
  final CodeGenericParamList generic;

  /// The list of data types that this class extends from.
  final CodeType extend;

  /// The list of data types that this class implements.
  final CodeTypeList implements;
  final CodeTypeList mixins;

  /// Class-level code comment.
  final CodeComment comment;

  final CodeAnnotationList annotations;

  /// The class body.
  final CodeBlock body;

  CodeClass({
    @required this.name,
    this.modifier,
    this.generic,
    this.extend,
    this.implements,
    this.mixins,
    this.annotations,
    this.comment,
    this.body,
  }) : assert(name != null);

  factory CodeClass.of({
    @required dynamic name,
    bool isPrivate,
    bool isPublic,
    bool isProtected,
    bool isInternal,
    bool isAbstract,
    bool isStatic,
    dynamic generic,
    dynamic extend,
    dynamic implements,
    dynamic mixins,
    dynamic constructors,
    dynamic fields,
    dynamic properties,
    dynamic functions,
    dynamic comment,
    dynamic annotations,
    dynamic body,
  }) =>
      CodeClass(
        name: CodeClassName.of(name),
        generic: CodeGenericParamList.of(generic),
        modifier: CodeModifier(
          isPrivate: isPrivate,
          isPublic: isPublic,
          isProtected: isProtected,
          isInternal: isInternal,
          isAbstract: isAbstract,
          isStatic: isStatic,
        ),
        extend: CodeType._parse(extend, error: () {
          throw 'invalid $extend type found.';
        }),
        implements: CodeTypeList.of(implements),
        mixins: CodeTypeList.of(mixins),
        annotations: CodeAnnotationList.of(annotations),
        body: CodeBlock.of(
          Container([
            CodeStatement.of(
              Container([
                CodeFieldList.of(fields),
                CodePropertyList.of(properties),
                CodeConstructorList.of(constructors),
                CodeFunctionList.of(functions),
              ]),
            ),
            CodeStatementList.of(body),
          ]),
        ),
        comment: CodeComment.of(comment),
      );
}
