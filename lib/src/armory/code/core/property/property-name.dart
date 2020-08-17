part of g3.armory;

class CodePropertyNameConfig extends CodeConfigNode<CodePropertyName> {
  CodePropertyNameConfig(NodeBuildFunc<CodePropertyName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodePropertyNameConfig.of(StringFunc func, Node child) =>
      CodePropertyNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodePropertyNameConfig.forDartLike(Node child) =>
      CodePropertyNameConfig((context, name) {
        final property = context.findAncestorNodeOfExactType<CodeProperty>();
        final modifier = property?.modifier;

        Node res = TextTransform(name.content, StringFuncs.camel);

        if (modifier?.private == true ||
            modifier?.protected == true ||
            modifier?.internal == true) {
          // Add '_' prefix for non public property.
          res = Pad.left('_', res);
        }

        return res;
      }, child);

  factory CodePropertyNameConfig.forJavaLike(Node child) =>
      CodePropertyNameConfig.of(StringFuncs.camel, child);
}

class CodePropertyName extends CodeConfigProxyNode<CodePropertyName> {
  final Node content;

  CodePropertyName._(this.content);

  factory CodePropertyName.of(dynamic text) {
    return _parseNode<CodePropertyName>(text, (v) {
      if (v is CodeField) return CodePropertyName._(v.name.content);
      if (v is CodeFieldName) return CodePropertyName._(v.content);
      return CodePropertyName._(Text.of(v));
    });
  }
}
