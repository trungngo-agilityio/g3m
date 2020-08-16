part of g3.armory;

class CodeFieldNameConfig extends CodeConfigNode<CodeFieldName> {
  CodeFieldNameConfig(NodeBuildFunc<CodeFieldName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFieldNameConfig.of(StringFunc func, Node child) =>
      CodeFieldNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeFieldNameConfig.forDartLike(Node child) =>
      CodeFieldNameConfig((context, name) {
        final modifier = name.modifier;
        Node res = TextTransform(name.content, StringFuncs.camel);

        if (modifier?.private == true ||
            modifier?.protected == true ||
            modifier?.internal == true) {
          // Add '_' prefix for non public field.
          res = Pad.left('_', res);
        }

        return res;
      }, child);

  factory CodeFieldNameConfig.forJavaLike(Node child) =>
      CodeFieldNameConfig.of(StringFuncs.camel, child);
}

class CodeFieldName extends CodeConfigProxyNode<CodeFieldName> {
  final Node content;

  final CodeModifier modifier;

  CodeFieldName._(this.content, {this.modifier});

  factory CodeFieldName.of(
    String text, {
    CodeModifier modifier,
  }) {
    if (text == null) return null;
    return CodeFieldName._(Text.of(text), modifier: modifier);
  }
}
