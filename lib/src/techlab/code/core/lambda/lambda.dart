part of g3.techlab;

class CodeLambdaConfig extends CodeConfigNode<CodeLambda> {
  CodeLambdaConfig(NodeBuildFunc<CodeLambda> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeLambdaConfig.forDartLike(Node child) =>
      CodeLambdaConfig._internal(child);

  factory CodeLambdaConfig.forJavaLike(Node child) =>
      CodeLambdaConfig._internal(child);

  factory CodeLambdaConfig._internal(
    Node child, {
    String throwKeyword = 'throws',
    bool overrideAsAnnotation = true,
  }) =>
      CodeLambdaConfig((context, func) {
        final def = Container([
          '(',
          func.args,
          ')',
        ]);

        Node body = func.body;
        body ??= CodeBlock._(null);

        return CodeExpr.closed(
          Container([
            def,
            Text.space(),
            body,
          ]),
        );
      }, child);
}

class CodeLambda extends CodeConfigProxyNode<CodeLambda> {
  final CodeArgList args;
  final CodeBlock body;

  CodeLambda._({
    this.args,
    this.body,
  });

  factory CodeLambda.of({
    dynamic requiredArgs,
    dynamic optionalArgs,
    dynamic namedArgs,
    bool isAsync,
    bool isStream,
    dynamic body,
  }) {
    return CodeLambda._(
      args: CodeArgList.of(
        required: requiredArgs,
        optional: optionalArgs,
        named: namedArgs,
      ),
      body: CodeBlock.of(CodeStatementList.of(body)),
    );
  }
}
