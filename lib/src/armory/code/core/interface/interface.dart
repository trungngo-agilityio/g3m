part of g3.armory;

class CodeInterfaceConfig extends CodeConfigNode<CodeInterface> {
  CodeInterfaceConfig(NodeBuildFunc<CodeInterface> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeInterfaceConfig.forJavaLike(
    Node child, {
    String classKeyword = 'interface',
    String extendsKeyword = 'extends',
  }) =>
      CodeInterfaceConfig((context, interface) {
        return Container([
          interface.comment,
          Trim.leftRight(
            Container([
              interface.access,
              ' ',
              classKeyword,
              ' ',
              interface.name,
              interface.generic,
              ' ',
              interface.extend != null
                  ? Container([
                      extendsKeyword,
                      ' ',
                      interface.extend,
                    ])
                  : null,
            ]),
          ),
          ' ',
          interface.body,
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

  factory CodeInterface.of({
    String name,
    CodeAccess access,
    CodeGenericParamList generic,
    CodeTypeList extend,
    CodeTypeList implements,
    CodeFieldList fields,
    CodeFunctionList functions,
    Node body,
    String comment,
  }) =>
      CodeInterface(
        name: CodeTypeName.of(name),
        generic: generic,
        access: access,
        extend: extend,
        body: CodeBlock(
          Container([
            fields,
            functions,
            body,
          ]),
        ),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
