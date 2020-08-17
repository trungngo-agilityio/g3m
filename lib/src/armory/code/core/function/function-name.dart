part of g3.armory;

class CodeFunctionNameConfig extends CodeConfigNode<CodeFunctionName> {
  CodeFunctionNameConfig(NodeBuildFunc<CodeFunctionName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionNameConfig.of(StringFunc func, Node child) =>
      CodeFunctionNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeFunctionNameConfig.forJavaLike(Node child) =>
      CodeFunctionNameConfig.of(StringFuncs.camel, child);

  factory CodeFunctionNameConfig.forDartLike(Node child) =>
      CodeFunctionNameConfig((context, name) {
        final field = context.findAncestorNodeOfExactType<CodeFunction>();
        final modifier = field?.modifier;

        Node res = TextTransform(name.name, StringFuncs.camel);

        if (modifier?.private == true ||
            modifier?.protected == true ||
            modifier?.internal == true) {
          // Add '_' prefix for non public field.
          res = Pad.left('_', res);
        }

        return res;
      }, child);
}

class CodeFunctionName extends CodeConfigProxyNode<CodeFunctionName>
    implements NamedNode {
  @override
  final Node name;

  CodeFunctionName(this.name);

  factory CodeFunctionName.of(String text) {
    return text == null ? null : CodeFunctionName(Text.of(text));
  }
}
