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
        clazz: code.commentTripleSplash,
        field: code.commentTripleSplash,
        function: code.commentTripleSplash,
        other: code.commentDoubleSplash,
      );

  factory CodeCommentConfig.forJavaLike(Node child) =>
      CodeCommentConfig.forCode(
        child,
        clazz: code.commentJavaDoc,
        field: code.commentDoubleSplash,
        function: code.commentJavaDoc,
        other: code.commentDoubleSplash,
      );

  factory CodeCommentConfig.forCode(
    Node child, {
    @required StringFunc clazz,
    @required StringFunc field,
    @required StringFunc function,
    @required StringFunc other,
  }) =>
      CodeCommentConfig((context, codeComment) {
        // Finds the nearest container for this comment.
        final container = context.ancestors.firstWhere(
            (e) => e is CodeClass || e is CodeField || e is CodeFunction,
            orElse: () => null);

        var func;
        if (container != null) {
          // Determines the comment style for the given container.
          if (container is CodeClass) {
            func = clazz;
          } else if (container is CodeField) {
            func = field;
          } else if (container is CodeFunction) {
            func = function;
          }
        }

        func ??= other;

        return Container([TextTransform(codeComment.content, func), NewLine()]);
      }, child);
}

class CodeComment extends CodeConfigProxyNode<CodeComment> {
  final Node content;

  CodeComment(this.content);

  factory CodeComment.of(String text) {
    return CodeComment(Text(text));
  }
}
