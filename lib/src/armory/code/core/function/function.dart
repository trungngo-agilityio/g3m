part of g3.armory;

class CodeFunctionConfig extends CodeConfigNode<CodeFunction> {
  CodeFunctionConfig(NodeBuildFunc<CodeFunction> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionConfig.forJavaLike(
    Node child, {
    String throwKeyword = 'throws',
  }) =>
      CodeFunctionConfig((context, func) {
        final def = Container([
          '\n',
          func.comment,
          func.annotations,
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
          func.throws != null
              ? Container([
                  throwKeyword != null
                      ? Container([
                          ' ',
                          throwKeyword,
                        ])
                      : null,
                  Text.space(),
                  func.throws,
                ])
              : null,
        ]);

        if (func.body == null) {
          return CodeStatement.of(def);
        } else {
          return Container([
            def,
            Text.space(),
            func.body,
          ]);
        }
      }, child);
}

class CodeFunction extends CodeConfigProxyNode<CodeFunction> {
  final CodeFunctionName name;
  final CodeComment comment;
  final CodeAnnotationList annotations;
  final CodeModifier modifier;
  final CodeGenericParamList generic;
  final CodeFunctionArgList args;
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
        args: args != null ? CodeFunctionArgList.ofNameTypeMap(args) : null,
        returns: returns != null ? CodeFunctionReturnList.list(returns) : null,
        throws: throws != null ? CodeFunctionThrowList.list(throws) : null,
        body: CodeBlock.of(CodeStatementList.of(body)),
      );
}
