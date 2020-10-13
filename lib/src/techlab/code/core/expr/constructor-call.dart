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
    return CodeConstructorCallConfig((context, call) {
      Node name = call.className;
      if (namedConstructorEnabled == true && call.name != null) {
        name = CodeAccessExpr.of(name, call.name);
      }

      if (call.instance != null) {
        name = Container([call.instance, '.', name]);
      }

      return CodeExpr.open(
        Container([
          call.comment,
          name,
          call.generic,
          '(',
          Join.commaSeparated(call.args),
          ')',
        ]),
      );
    }, child);
  }
}

class CodeConstructorCall extends CodeConfigProxyNode<CodeConstructorCall> {
  final CodeRef instance;
  final CodeClassName className;
  final CodeConstructorName name;
  final CodeComment comment;
  final CodeGenericParamList generic;
  final List<CodeExpr> args;

  CodeConstructorCall({
    this.instance,
    @required this.className,
    this.name,
    this.comment,
    this.generic,
    this.args,
  });

  factory CodeConstructorCall.of({
    dynamic instance,
    @required dynamic className,
    dynamic name,
    dynamic comment,
    dynamic generic,
    dynamic args,
  }) =>
      CodeConstructorCall(
        instance: CodeRef.of(instance),
        className: CodeClassName.of(className),
        name: CodeConstructorName.of(name),
        comment: CodeComment.of(comment),
        generic: CodeGenericParamList.of(generic),
        args: CodeExpr.listOf(args),
      );
}
