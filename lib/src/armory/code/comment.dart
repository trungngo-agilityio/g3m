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
}

class CodeComment extends CodeConfigProxyNode<CodeComment> {
  final Node content;

  CodeComment(this.content);

  factory CodeComment.text(String text) {
    return CodeComment(Text(text));
  }
}
