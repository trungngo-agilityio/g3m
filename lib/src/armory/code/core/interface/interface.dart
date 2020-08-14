part of g3.armory;

class CodeInterfaceConfig extends CodeConfigNode<CodeInterface> {
  CodeInterfaceConfig(NodeBuildFunc<CodeInterface> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeInterfaceConfig.forJavaLike(
    Node child, {
    String classKeyword = 'interface ',
    String extendsKeyword = 'extends ',
  }) =>
      CodeInterfaceConfig((context, interface) {
        return Container([
          '\n',
          interface.comment,
          Trim.leftRight(
            Container([
              interface.access,
              classKeyword,
              interface.name,
              interface.generic,
              ' ',
              interface.extend != null
                  ? Container([
                      extendsKeyword,
                      interface.extend,
                    ])
                  : null,
            ]),
          ),
          ' ',
          interface.body,
          '\n',
        ]);
      }, child);
}

class CodeInterface extends CodeConfigProxyNode<CodeInterface> {
  /// The class name.
  final CodeTypeName name;

  /// Defines public, private, protected, etc.
  final CodeAccess access;

  /// The list of generic param applied for the class.
  final CodeGenericParamList generic;

  /// The list of data types that this class extends from.
  final CodeTypeList extend;

  /// Interface-level code comment.
  final CodeComment comment;

  /// The class body.
  final CodeBlock body;

  CodeInterface({
    @required this.name,
    this.access,
    this.generic,
    this.extend,
    this.comment,
    this.body,
  }) : assert(name != null);

  factory CodeInterface.of(
    String name, {
    String comment,
    bool private,
    bool public,
    bool protected,
    bool internal,
    bool abstract,
    bool static,
    List<CodeGenericParam> generic,
    List<CodeType> extend,
    List<CodeField> fields,
    List<CodeFunction> functions,
    Node body,
  }) =>
      CodeInterface(
        name: CodeTypeName.of(name),
        comment: comment != null ? CodeComment.of(comment) : null,
        access: CodeAccess(
          private: private,
          public: public,
          protected: protected,
          internal: internal,
          abstract: abstract,
          static: static,
        ),
        generic: CodeGenericParamList.of(generic),
        extend: CodeTypeList.of(extend),
        body: CodeBlock.of(
          Container([
            CodeFieldList.of(fields),
            CodeFunctionList.of(functions),
            body,
          ]),
        ),
      );
}
