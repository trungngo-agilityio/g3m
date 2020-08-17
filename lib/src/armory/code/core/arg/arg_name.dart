part of g3.armory;

class CodeArgNameConfig extends CodeConfigNode<CodeArgName> {
  CodeArgNameConfig(NodeBuildFunc<CodeArgName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeArgNameConfig.of(StringFunc func, Node child) =>
      CodeArgNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeArgNameConfig.forJavaLike(Node child) =>
      CodeArgNameConfig.of(StringFuncs.camel, child);
}

class CodeArgName extends CodeConfigProxyNode<CodeArgName> {
  final Node content;

  CodeArgName(this.content);

  factory CodeArgName.of(dynamic text) {
    return _parseNode<Node>(text, (v) {
      if (v is Node) return CodeArgName(v);
      return CodeArgName(Text.of(v?.toString()));
    });
  }
}
