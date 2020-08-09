part of g3.armory;

class CodeFunctionBodyConfig extends CodeConfigNode<CodeFunctionBody> {
  CodeFunctionBodyConfig(NodeBuildFunc<CodeFunctionBody> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionBodyConfig.asCodeBlock(Node child) =>
      CodeFunctionBodyConfig((context, funcBody) {
        return CodeBlock(funcBody.content);
      }, child);
}

class CodeFunctionBody extends CodeConfigProxyNode<CodeFunctionBody> {
  final Node content;

  CodeFunctionBody(this.content);
}
