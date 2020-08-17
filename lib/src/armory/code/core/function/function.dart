part of g3.armory;

class CodeFunctionConfig extends CodeConfigNode<CodeFunction> {
  CodeFunctionConfig(NodeBuildFunc<CodeFunction> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionConfig.forDartLike(Node child) =>
      CodeFunctionConfig._internal(child, overrideAsAnnotation: true);

  factory CodeFunctionConfig.forJavaLike(Node child) =>
      CodeFunctionConfig._internal(
        child,
      );

  factory CodeFunctionConfig._internal(
    Node child, {
    String throwKeyword = 'throws',
    bool overrideAsAnnotation,
  }) =>
      CodeFunctionConfig((context, func) {
        final def = Container([
          '\n',
          func.comment,
          func.annotations,

          // In the case of dart language, override is an annotation.
          // For csharp, it is an modifier.
          overrideAsAnnotation == true && func.modifier?.override == true
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

class CodeFunction extends CodeConfigProxyNode<CodeFunction> {
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

  factory CodeFunction.of(
    String name, {
    String comment,
    List<CodeAnnotation> annotations,
    bool override,
    bool private,
    bool public,
    bool protected,
    bool internal,
    bool abstract,
    bool static,
    List<String> generic,
    Map<String, String> args,
    bool async,
    bool stream,
    List<String> returns,
    List<String> throws,
    List<dynamic> body,
  }) =>
      CodeFunction(
        name: CodeFunctionName.of(name),
        comment: comment != null ? CodeComment.of(comment) : null,
        annotations: CodeAnnotationList.of(annotations),
        modifier: CodeModifier(
          override: override,
          private: private,
          public: public,
          protected: protected,
          internal: internal,
          static: static,
        ),
        generic: generic != null ? CodeGenericParamList.list(generic) : null,
        args: args != null ? CodeArgList.ofNameTypeMap(args) : null,
        returns: returns != null ? CodeFunctionReturnList.list(returns) : null,
        throws: throws != null ? CodeFunctionThrowList.list(throws) : null,
        body: CodeBlock.of(CodeStatementList.of(body)),
      );
}
