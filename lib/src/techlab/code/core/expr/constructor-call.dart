part of g3.techlab;

class CodeConstructorCallConfig extends CodeConfigNode<CodeConstructorCall> {
  CodeConstructorCallConfig(
      NodeBuildFunc<CodeConstructorCall> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeConstructorCallConfig.forDartLike(Node child) =>
      CodeConstructorCallConfig.internal(child, namedConstructorEnabled: true);

  factory CodeConstructorCallConfig.forJavaLike(Node child) =>
      CodeConstructorCallConfig.internal(child, namedConstructorEnabled: false);

  factory CodeConstructorCallConfig.internal(
    Node child, {
    @required bool namedConstructorEnabled,
  }) {
    return CodeConstructorCallConfig((context, func) {
      Node name = func.className;
      if (namedConstructorEnabled == true && func.name != null) {
        name = CodeAccessExpr.of(name, func.name);
      }

      return CodeExpr.open(
        Container([
          func.comment,
          name,
          func.generic,
          '(',
          Join.commaSeparated(func.args),
          ')',
        ]),
      );
    }, child);
  }
}

class CodeConstructorCall extends CodeConfigProxyNode<CodeConstructorCall> {
  final CodeClassName className;
  final CodeConstructorName name;
  final CodeComment comment;
  final CodeGenericParamList generic;
  final List<CodeExpr> args;

  CodeConstructorCall({
    @required this.className,
    this.name,
    this.comment,
    this.generic,
    this.args,
  });

  factory CodeConstructorCall.of({
    @required dynamic className,
    dynamic name,
    dynamic comment,
    dynamic generic,
    dynamic args,
  }) =>
      CodeConstructorCall(
        className: CodeClassName.of(className),
        name: CodeConstructorName.of(name),
        comment: CodeComment.of(comment),
        generic: CodeGenericParamList.of(generic),
        args: CodeExpr.listOf(args),
      );
}
