part of g3.armory;

class CodeCommentConfig extends CodeConfigNode<CodeComment> {
  CodeCommentConfig(NodeBuildFunc<CodeComment> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeCommentConfig.byStringFunc(StringFunc func, Node child) =>
      CodeCommentConfig((context, codeComment) {
        return Container([TextTransform(codeComment.content, func), NewLine()]);
      }, child);

  factory CodeCommentConfig.doubleSplash(Node child) =>
      CodeCommentConfig.byStringFunc(code.commentDoubleSplash, child);

  factory CodeCommentConfig.tripleSplash(Node child) =>
      CodeCommentConfig.byStringFunc(code.commentTripleSplash, child);

  factory CodeCommentConfig.javaDoc(Node child) =>
      CodeCommentConfig.byStringFunc(code.commentJavaDoc, child);

  factory CodeCommentConfig.hash(Node child) =>
      CodeCommentConfig.byStringFunc(code.commentHash, child);

  factory CodeCommentConfig.forDartLike(Node child) =>
      CodeCommentConfig.forCode(
        child,
        enumFunc: code.commentTripleSplash,
        classFunc: code.commentTripleSplash,
        interfaceFunc: code.commentTripleSplash,
        fieldFunc: code.commentTripleSplash,
        constructorFunc: code.commentTripleSplash,
        functionFunc: code.commentTripleSplash,
        otherFunc: code.commentDoubleSplash,
      );

  factory CodeCommentConfig.forJavaLike(Node child) =>
      CodeCommentConfig.forCode(
        child,
        enumFunc: code.commentJavaDoc,
        classFunc: code.commentJavaDoc,
        interfaceFunc: code.commentJavaDoc,
        fieldFunc: code.commentDoubleSplash,
        constructorFunc: code.commentJavaDoc,
        functionFunc: code.commentJavaDoc,
        otherFunc: code.commentDoubleSplash,
      );

  factory CodeCommentConfig.forCode(
    Node child, {
    @required StringFunc enumFunc,
    @required StringFunc classFunc,
    @required StringFunc interfaceFunc,
    @required StringFunc fieldFunc,
    @required StringFunc constructorFunc,
    @required StringFunc functionFunc,
    @required StringFunc otherFunc,
  }) =>
      CodeCommentConfig((context, codeComment) {
        // Finds the nearest container for this comment.
        final container = context.ancestors.firstWhere(
            (e) =>
                e is CodeEnum ||
                e is CodeClass ||
                e is CodeInterface ||
                e is CodeField ||
                e is CodeClassConstructor ||
                e is CodeFunction,
            orElse: () => null);

        var func;
        if (container != null) {
          // Determines the comment style for the given container.
          if (container is CodeEnum) {
            func = enumFunc;
          } else if (container is CodeClass) {
            func = classFunc;
          } else if (container is CodeInterface) {
            func = interfaceFunc;
          } else if (container is CodeField) {
            func = fieldFunc;
          } else if (container is CodeClassConstructor) {
            func = constructorFunc;
          } else if (container is CodeFunction) {
            func = functionFunc;
          }
        }

        func ??= otherFunc;

        return Container([TextTransform(codeComment.content, func), NewLine()]);
      }, child);
}

class CodeComment extends CodeConfigProxyNode<CodeComment> {
  final Node content;

  CodeComment(this.content);

  factory CodeComment.of(String text) =>
      text != null ? CodeComment(Text.of(text)) : null;
}
