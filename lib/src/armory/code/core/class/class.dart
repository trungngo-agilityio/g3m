part of g3.armory;

class CodeClassConfig extends CodeConfigNode<CodeClass> {
  CodeClassConfig(NodeBuildFunc<CodeClass> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConfig.forJavaLike(
    Node child, {
    String classKeyword = 'class ',
    String extendsKeyword = 'extends ',
    String implementsKeyword = 'implements ',
  }) =>
      CodeClassConfig((context, clazz) {
        return Container([
          '\n',
          clazz.comment,
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
              ' ',
              clazz.implements != null
                  ? Container([
                      implementsKeyword,
                      clazz.implements,
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

class CodeClass extends CodeConfigProxyNode<CodeClass> {
  /// The class name.
  final CodeClassName name;

  /// Defines public, private, protected, etc.
  final CodeModifier modifier;

  /// The list of generic param applied for the class.
  final CodeGenericParamList generic;

  /// The list of data types that this class extends from.
  final CodeType extend;

  /// The list of data types that this class implements.
  final CodeTypeList implements;

  /// Class-level code comment.
  final CodeComment comment;

  /// The class body.
  final CodeBlock body;

  CodeClass({
    @required this.name,
    this.modifier,
    this.generic,
    this.extend,
    this.implements,
    this.comment,
    this.body,
  }) : assert(name != null);

  factory CodeClass.of(
    String name, {
    bool private,
    bool public,
    bool protected,
    bool internal,
    bool abstract,
    bool static,
    List<CodeGenericParam> generic,
    CodeType extend,
    List<CodeType> implements,
    List<CodeConstructor> constructors,
    List<CodeField> fields,
    List<CodeFunction> functions,
    String comment,
    dynamic body,
  }) =>
      CodeClass(
        name: CodeClassName.of(name),
        generic: CodeGenericParamList.of(generic),
        modifier: CodeModifier(
          private: private,
          public: public,
          protected: protected,
          internal: internal,
          abstract: abstract,
          static: static,
        ),
        extend: extend,
        implements: CodeTypeList.of(implements),
        body: CodeBlock.of(
          CodeStatement.of(
            Container([
              Container(fields),
              CodeClassConstructorList(constructors),
              CodeFunctionList.of(functions),
              CodeStatementList._parse(body) ?? body,
            ]),
          ),
        ),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
