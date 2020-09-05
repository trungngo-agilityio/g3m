part of g3.techlab;

class CodeExtensionConfig extends CodeConfigNode<CodeExtension> {
  CodeExtensionConfig(NodeBuildFunc<CodeExtension> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeExtensionConfig.forDartLike(
    Node child, {
    String extensionKeyword = 'extension ',
    String onKeyword = 'on ',
    String implementsKeyword = 'implements ',
  }) =>
      CodeExtensionConfig((context, extension) {
        return Container([
          '\n',
          extension.comment,
          Trim.leftRight(
            Container([
              extension.modifier,
              extensionKeyword,
              extension.name,
              extension.generic,
              ' ',
              extension.extend != null
                  ? Container([
                      onKeyword,
                      extension.extend,
                    ])
                  : null,
              ' ',
              extension.implements != null
                  ? Container([
                      implementsKeyword,
                      extension.implements,
                    ])
                  : null,
            ]),
          ),
          ' ',
          extension.body,
          '\n',
        ]);
      }, child);
}

class CodeExtension extends CodeConfigProxyNode<CodeExtension>
    implements _NamedNode {
  /// The class name.
  @override
  final CodeExtensionName name;

  /// Defines public, private, protected, etc.
  final CodeModifier modifier;

  /// The list of generic param applied for the class.
  final CodeGenericParamList generic;

  /// The list of data types that this class extends from.
  final CodeType extend;

  /// The list of data types that this class implements.
  final CodeTypeList implements;

  /// Extension-level code comment.
  final CodeComment comment;

  /// The class body.
  final CodeBlock body;

  CodeExtension({
    @required this.name,
    this.modifier,
    this.generic,
    this.extend,
    this.implements,
    this.comment,
    this.body,
  }) : assert(name != null);

  factory CodeExtension.of({
    @required dynamic name,
    bool isPrivate,
    bool isPublic,
    bool isProtected,
    bool isInternal,
    dynamic generic,
    @required dynamic on,
    dynamic implements,
    dynamic fields,
    dynamic properties,
    dynamic functions,
    dynamic comment,
    dynamic body,
  }) =>
      CodeExtension(
        name: CodeExtensionName.of(name),
        generic: CodeGenericParamList.of(generic),
        modifier: CodeModifier(
          isPrivate: isPrivate,
          isPublic: isPublic,
          isProtected: isProtected,
          isInternal: isInternal,
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
