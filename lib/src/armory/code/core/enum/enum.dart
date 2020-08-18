part of g3.armory;

class CodeEnumConfig extends CodeConfigNode<CodeEnum> {
  CodeEnumConfig(NodeBuildFunc<CodeEnum> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumConfig.forJavaLike(
    Node child, {
    String enumKeyword = 'enum ',
  }) =>
      CodeEnumConfig((context, def) {
        Node valuesAndBody = def.values;

        if (valuesAndBody == null) {
          valuesAndBody = def.body;
        } else if (def.body != null) {
          valuesAndBody = Container([
            valuesAndBody,
            ';\n',
            def.body,
          ]);
        }
        valuesAndBody = CodeBlock._(valuesAndBody);

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
          valuesAndBody,
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

  final CodeEnumValueList values;

  final CodeStatementList body;

  CodeEnum._({
    @required this.name,
    this.modifier,
    this.comment,
    this.values,
    this.body,
  }) : assert(name != null);

  static CodeEnum _parse(dynamic value, {_NodeParseErrorFunc error}) {
    return _parseNode<CodeEnum>(value, (v) {
      // Try to parse the input as a list. This must success, even
      // one single value passed in, it should return a list type.
      final list = _parseNodeList<dynamic>(v, (v) => v);

      if (list?.isNotEmpty == true) {
        // allows enum to be parsed in as an array of values
        final name = CodeEnumName._parse(list[0]);
        if (name != null && list.length > 1) {
          // Continues parsing the initializers
          final values = CodeEnumValueList._parse(list.sublist(1));
          return CodeEnum._(name: name, values: values);
        }
      }

      return null;
    }, error: error);
  }

  factory CodeEnum.of(
    dynamic name, {
    bool private,
    bool public,
    bool protected,
    bool internal,
    dynamic values,
    dynamic comment,
    dynamic body,
  }) {
    return CodeEnum._(
      name: CodeEnumName.of(name),
      modifier: CodeModifier(
        private: private,
        public: public,
        protected: protected,
        internal: internal,
      ),
      values: CodeEnumValueList.of(values),
      comment: CodeComment.of(comment),
      body: CodeStatementList.of(body),
    );
  }
}
