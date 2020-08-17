part of g3.armory;

class CodeEnumConfig extends CodeConfigNode<CodeEnum> {
  CodeEnumConfig(NodeBuildFunc<CodeEnum> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumConfig.forJavaLike(
    Node child, {
    String enumKeyword = 'enum ',
  }) =>
      CodeEnumConfig((context, def) {
        return Container([
          '\n',
          def.comment,
          Trim.leftRight(
            Container([
              def.modifier,
              enumKeyword,
              def.name,
            ]),
          ),
          ' ',
          def.body,
          '\n',
        ]);
      }, child);
}

class CodeEnum extends CodeConfigProxyNode<CodeEnum> implements NamedNode {
  /// The class name.
  @override
  final CodeEnumName name;

  /// Defines public, private, protected, etc.
  final CodeModifier modifier;

  /// Enum-level code comment.
  final CodeComment comment;

  /// The class body.
  final CodeBlock body;

  CodeEnum({
    @required this.name,
    this.modifier,
    this.comment,
    this.body,
  }) : assert(name != null);

  factory CodeEnum.of(
    String name, {
    bool private,
    bool public,
    bool protected,
    bool internal,
    List<CodeEnumValue> values,
    String comment,
    Node body,
  }) =>
      CodeEnum(
        name: CodeEnumName.of(name),
        modifier: CodeModifier(
          private: private,
          public: public,
          protected: protected,
          internal: internal,
        ),
        body: CodeBlock.of(
          Container([
            CodeEnumValueList.of(values),
            body,
          ]),
        ),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
