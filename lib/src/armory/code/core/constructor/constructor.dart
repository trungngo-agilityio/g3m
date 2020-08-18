part of g3.armory;

class CodeConstructorConfig extends CodeConfigNode<CodeConstructor> {
  CodeConstructorConfig(NodeBuildFunc<CodeConstructor> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeConstructorConfig.forDartLike(Node child) =>
      CodeConstructorConfig._internal(child,
          appendConstructorName: true, appendClassName: true);

  factory CodeConstructorConfig.forJavaLike(Node child) =>
      CodeConstructorConfig._internal(child,
          appendConstructorName: false, appendClassName: true);

  factory CodeConstructorConfig._internal(
    Node child, {
    String constructorKeyword,
    bool appendClassName = true,
    bool appendConstructorName = false,
  }) =>
      CodeConstructorConfig((context, constructor) {
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
              constructor.init,
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

class CodeConstructor extends CodeConfigProxyNode<CodeConstructor>
    implements _NamedNode {
  /// The constructor name. This is often optional.
  @override
  final CodeConstructorName name;

  /// Defines public, private, protected, etc.
  final CodeModifier modifier;

  /// The comment level for constructor.
  final CodeComment comment;

  /// The constructor argument list.
  final CodeArgList args;

  /// The list of initializer expressions
  final CodeStatementList init;

  /// The class implementation body
  final CodeBlock body;

  CodeConstructor._({
    this.name,
    this.modifier,
    this.comment,
    this.args,
    this.init,
    this.body,
  });

  /// Creates a constructor method.
  /// - [name] is a dynamic field that accepts:
  ///   - a [String] name
  ///   - any object that implements [_NamedNode]. This field will have the
  ///     the same name with the other object.
  ///   - any object. In this case, the whole object will be converted
  ///     to string.
  ///
  /// - zero or one of [public], [private], [protected], and [internal] should
  ///   be specified to control the constructor access modifier.
  ///
  /// - [requiredArgs], [optionalArgs], and [namedArgs] are the list of
  /// arguments of the constructor. For language that does not support
  /// optional and named args, those will be rendered just like required arg.
  /// See [CodeArg.of] method to see different format can be sent into the
  /// argument.
  ///
  /// - [init] is the list of initializers for the constructor.
  /// - [body] is the constructor function body.
  ///
  factory CodeConstructor.of({
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
    dynamic init,
    dynamic body,
  }) {
    return CodeConstructor._(
      name: CodeConstructorName.of(name),
      modifier: CodeModifier(
        factory: factory,
        isPrivate: private,
        isPublic: public,
        isProtected: protected,
        isInternal: internal,
      ),
      args: CodeArgList.of(
        required: requiredArgs,
        optional: optionalArgs,
        named: namedArgs,
      ),
      init: CodeStatementList.of(init, closed: true),
      comment: CodeComment.of(comment),
      body: CodeBlock.of(CodeStatementList.of(body)),
    );
  }
}
