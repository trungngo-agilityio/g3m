part of g3.armory;

class CodeConstructorConfig extends CodeConfigNode<CodeConstructor> {
  CodeConstructorConfig(NodeBuildFunc<CodeConstructor> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeConstructorConfig.forJavaLike(
    Node child, {
    String constructorKeyword = 'constructor',
  }) =>
      CodeConstructorConfig((context, func) {
        final def = Container([
          func.comment,
          Text(constructorKeyword),
          func.name,
          Text('('),
          func.args,
          Text(')'),
        ]);

        if (func.body == null) {
          return CodeStatement(def);
        } else {
          return Container([
            def,
            Text.space(),
            func.body,
          ]);
        }
      }, child);
}

class CodeConstructor extends CodeConfigProxyNode<CodeConstructor> {
  /// The constructor name. This is often optional.
  final CodeName name;

  /// Defines public, private, protected, etc.
  final CodeAccess access;

  /// The comment level for constructor.
  final CodeComment comment;

  /// The constructor argument list.
  final CodeFunctionArgList args;

  /// The class implementation body
  final CodeFunctionBody body;

  CodeConstructor({
    this.name,
    this.access,
    this.comment,
    this.args,
    this.body,
  });

  factory CodeConstructor.simple({
    String name,
    String comment,
    Map<String, String> args,
    List<String> returns,
    List<String> throws,
    List<String> body,
  }) =>
      CodeConstructor(
        name: CodeName.of(name),
        comment: comment != null ? CodeComment.of(comment) : null,
        args: args != null ? CodeFunctionArgList.ofNameTypeMap(args) : null,
        body: body != null
            ? CodeFunctionBody(CodeStatementList.list(body))
            : null,
      );
}
