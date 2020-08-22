part of g3.armory;

class CodeFunctionConfig extends CodeConfigNode<CodeFunction> {
  CodeFunctionConfig(NodeBuildFunc<CodeFunction> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionConfig.forDartLike(Node child) =>
      CodeFunctionConfig._internal(child);

  factory CodeFunctionConfig.forJavaLike(Node child) =>
      CodeFunctionConfig._internal(child);

  factory CodeFunctionConfig._internal(
    Node child, {
    String throwKeyword = 'throws',
    bool overrideAsAnnotation = true,
  }) =>
      CodeFunctionConfig((context, func) {
        final def = Container([
          '\n',
          func.comment,
          func.annotations,

          // In the case of dart language, override is an annotation.
          // For csharp, it is an modifier.
          overrideAsAnnotation == true && func.modifier?.isOverride == true
              ? '@override\n'
              : null,
          func.returns != null
              ? Container([
                  func.returns,
                  Text.space(),
                ])
              : null,
          func.modifier,
          func.name,
          func.generic,
          '(',
          func.args,
          ')',
          func.throws,
        ]);

        if (func.body == null) {
          return CodeExpr.open(def);
        } else {
          return CodeExpr.closed(
            Container([
              def,
              Text.space(),
              func.body,
            ]),
          );
        }
      }, child);
}

class CodeFunction extends CodeConfigProxyNode<CodeFunction>
    implements _NamedNode {
  @override
  final CodeFunctionName name;
  final CodeComment comment;
  final CodeAnnotationList annotations;
  final CodeModifier modifier;
  final CodeGenericParamList generic;
  final CodeArgList args;
  final CodeFunctionReturnList returns;
  final CodeFunctionThrowList throws;
  final CodeBlock body;

  CodeFunction({
    @required this.name,
    this.comment,
    this.annotations,
    this.modifier,
    this.generic,
    this.args,
    this.returns,
    this.throws,
    this.body,
  });

  factory CodeFunction.of({
    @required dynamic name,
    dynamic comment,
    dynamic annotations,
    bool isOverride,
    bool isPrivate,
    bool isPublic,
    bool isProtected,
    bool isInternal,
    bool isAbstract,
    bool isStatic,
    dynamic generic,
    dynamic requiredArgs,
    dynamic optionalArgs,
    dynamic namedArgs,
    bool isAsync,
    bool isStream,
    dynamic returns,
    dynamic throws,
    dynamic body,
  }) {
    return CodeFunction(
      name: CodeFunctionName.of(
        name: name,
        isOverride: isOverride,
        isPrivate: isPrivate,
        isPublic: isPublic,
        isProtected: isProtected,
        isInternal: isInternal,
        isStatic: isStatic,
      ),
      comment: CodeComment.of(comment),
      annotations: CodeAnnotationList.of(annotations),
      modifier: CodeModifier(
        isOverride: isOverride,
        isPrivate: isPrivate,
        isPublic: isPublic,
        isProtected: isProtected,
        isInternal: isInternal,
        isStatic: isStatic,
      ),
      generic: CodeGenericParamList.of(generic),
      args: CodeArgList.of(
        required: requiredArgs,
        optional: optionalArgs,
        named: namedArgs,
      ),
      returns: CodeFunctionReturnList.of(returns),
      throws: CodeFunctionThrowList.of(throws),
      body: CodeBlock.of(CodeStatementList.of(body)),
    );
  }
}
