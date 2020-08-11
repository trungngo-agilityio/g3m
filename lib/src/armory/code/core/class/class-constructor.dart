part of g3.armory;

class CodeClassConstructorConfig extends CodeConfigNode<CodeClassConstructor> {
  CodeClassConstructorConfig(
      NodeBuildFunc<CodeClassConstructor> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConstructorConfig.forJavaLike(
    Node child, {
    String constructorKeyword = 'constructor',
  }) =>
      CodeClassConstructorConfig((context, func) {
        final def = Container([
          func.comment,
          constructorKeyword,
          func.name,
          '(',
          func.args,
          ')',
        ]);

        if (func.body == null) {
          return CodeStatement(def);
        } else {
          return Container([
            def,
            ' ',
            func.body,
          ]);
        }
      }, child);
}

class CodeClassConstructor extends CodeConfigProxyNode<CodeClassConstructor> {
  /// The constructor name. This is often optional.
  final CodeName name;

  /// Defines public, private, protected, etc.
  final CodeAccess access;

  /// The comment level for constructor.
  final CodeComment comment;

  /// The constructor argument list.
  final CodeFunctionArgList args;

  /// The class implementation body
  final CodeBlock body;

  CodeClassConstructor({
    this.name,
    this.access,
    this.comment,
    this.args,
    this.body,
  });

  factory CodeClassConstructor.of({
    String name,
    String comment,
    Map<String, String> args,
    List<String> returns,
    List<String> throws,
    dynamic body,
  }) =>
      CodeClassConstructor(
        name: CodeName.of(name),
        comment: comment != null ? CodeComment.of(comment) : null,
        args: args != null ? CodeFunctionArgList.ofNameTypeMap(args) : null,
        body: CodeBlock.of(body),
      );
}
