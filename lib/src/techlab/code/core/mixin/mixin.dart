part of g3.techlab;

class CodeMixinConfig extends CodeConfigNode<CodeMixin> {
  CodeMixinConfig(NodeBuildFunc<CodeMixin> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeMixinConfig.forDartLike(
    Node child, {
    String mixinKeyword = 'mixin ',
    String onKeyword = 'on ',
    String implementsKeyword = 'implements ',
  }) =>
      CodeMixinConfig((context, mixin) {
        return Container([
          '\n',
          mixin.comment,
          Trim.leftRight(
            Container([
              mixin.modifier,
              mixinKeyword,
              mixin.name,
              mixin.generic,
              ' ',
              mixin.extend != null
                  ? Container([
                      onKeyword,
                      mixin.extend,
                    ])
                  : null,
              ' ',
              mixin.implements != null
                  ? Container([
                      implementsKeyword,
                      mixin.implements,
                    ])
                  : null,
            ]),
          ),
          ' ',
          mixin.body,
          '\n',
        ]);
      }, child);
}

class CodeMixin extends CodeConfigProxyNode<CodeMixin> implements _NamedNode {
  /// The class name.
  @override
  final CodeMixinName name;

  /// Defines public, private, protected, etc.
  final CodeModifier modifier;

  /// The list of generic param applied for the class.
  final CodeGenericParamList generic;

  /// The list of data types that this class extends from.
  final CodeType extend;

  /// The list of data types that this class implements.
  final CodeTypeList implements;

  /// Mixin-level code comment.
  final CodeComment comment;

  /// The class body.
  final CodeBlock body;

  CodeMixin({
    @required this.name,
    this.modifier,
    this.generic,
    this.extend,
    this.implements,
    this.comment,
    this.body,
  }) : assert(name != null);

  factory CodeMixin.of({
    @required dynamic name,
    bool isPrivate,
    bool isPublic,
    bool isProtected,
    bool isInternal,
    bool isAbstract,
    bool isStatic,
    dynamic generic,
    dynamic on,
    dynamic implements,
    dynamic fields,
    dynamic properties,
    dynamic functions,
    dynamic comment,
    dynamic body,
  }) =>
      CodeMixin(
        name: CodeMixinName.of(name),
        generic: CodeGenericParamList.of(generic),
        modifier: CodeModifier(
          isPrivate: isPrivate,
          isPublic: isPublic,
          isProtected: isProtected,
          isInternal: isInternal,
          isAbstract: isAbstract,
          isStatic: isStatic,
        ),
        extend: CodeType._parse(on, error: () {
          throw 'invalid $on type found.';
        }),
        implements: CodeTypeList.of(implements),
        body: CodeBlock.of(
          Container([
            CodeStatement.of(
              Container([
                CodeFieldList.of(fields),
                CodePropertyList.of(properties),
                CodeFunctionList.of(functions),
              ]),
            ),
            CodeStatementList.of(body),
          ]),
        ),
        comment: CodeComment.of(comment),
      );
}
