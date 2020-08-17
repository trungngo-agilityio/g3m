part of g3.armory;

class CodeClassConstructorConfig extends CodeConfigNode<CodeClassConstructor> {
  CodeClassConstructorConfig(
      NodeBuildFunc<CodeClassConstructor> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConstructorConfig.forDartLike(Node child) =>
      CodeClassConstructorConfig._internal(child,
          appendConstructorName: true, appendClassName: true);

  factory CodeClassConstructorConfig.forJavaLike(Node child) =>
      CodeClassConstructorConfig._internal(child,
          appendConstructorName: false, appendClassName: true);

  factory CodeClassConstructorConfig._internal(
    Node child, {
    String constructorKeyword,
    bool appendClassName = true,
    bool appendConstructorName = false,
  }) =>
      CodeClassConstructorConfig((context, constructor) {
        final clazz = context.dependOnAncestorNodeOfExactType<CodeClass>();

        Node name;

        if (appendClassName == true &&
            appendConstructorName == true &&
            constructor.name != null) {
          name = Container([clazz.name, '.', constructor.name]);
        } else if (appendClassName) {
          name = clazz.name;
        } else {
          name = constructor.name;
        }

        Node init;
        if (constructor.init?.isNotEmpty == true) {
          init = Container([
            ':\n',
            Indent(Join.of(',\n', constructor.init), level: 2),
            ' ',
          ]);
        }

        final def = Container([
          '\n',
          constructor.comment,
          Trim.leftRight(
            Container([
              constructor.modifier,
              constructorKeyword,
              name,
              '(',
              constructor.args,
              ')',
              init,
            ]),
          ),
        ]);

        if (constructor.body == null) {
          return CodeExpr.open(def);
        } else {
          return CodeExpr.closed(
            Container([
              def,
              ' ',
              constructor.body,
              '\n',
            ]),
          );
        }
      }, child);
}

class CodeClassConstructor extends CodeConfigProxyNode<CodeClassConstructor> {
  /// The constructor name. This is often optional.
  final CodeClassConstructorName name;

  /// Defines public, private, protected, etc.
  final CodeModifier modifier;

  /// The comment level for constructor.
  final CodeComment comment;

  /// The constructor argument list.
  final CodeArgList args;

  /// The list of initializer expressions
  final List<OldCodeExpr> init;

  /// The class implementation body
  final CodeBlock body;

  CodeClassConstructor({
    this.name,
    this.modifier,
    this.comment,
    this.args,
    this.init,
    this.body,
  });

  factory CodeClassConstructor.of({
    dynamic name,
    bool factory,
    bool private,
    bool public,
    bool protected,
    bool internal,
    dynamic requiredArgs,
    dynamic optionalArgs,
    dynamic namedArgs,
    dynamic comment,
    List<dynamic> init,
    dynamic body,
  }) {
    return CodeClassConstructor(
      name: CodeClassConstructorName.of(name),
      modifier: CodeModifier(
        factory: factory,
        private: private,
        public: public,
        protected: protected,
        internal: internal,
      ),
      args: CodeArgList.of(
        required: requiredArgs,
        optional: optionalArgs,
        named: namedArgs,
      ),
      init: init?.map((e) => OldCodeExpr.of(e))?.toList(),
      comment: CodeComment.of(comment),
      body: CodeBlock.of(CodeStatement.of(body)),
    );
  }

  factory CodeClassConstructor.simple({
    String name,
    bool factory,
    bool private,
    bool public,
    bool protected,
    bool internal,
    Map<String, String> args,
    String comment,
    List<dynamic> init,
    Node body,
  }) =>
      CodeClassConstructor(
        name: CodeClassConstructorName.of(name),
        modifier: CodeModifier(
          factory: factory,
          private: private,
          public: public,
          protected: protected,
          internal: internal,
        ),
        comment: comment != null ? CodeComment.of(comment) : null,
        init: init?.map((e) => OldCodeExpr.of(e))?.toList(),
        args: args != null ? CodeArgList.ofNameTypeMap(args) : null,
        body: CodeBlock.of(body),
      );
}
