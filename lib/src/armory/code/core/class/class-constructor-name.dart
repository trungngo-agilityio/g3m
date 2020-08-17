part of g3.armory;

class CodeClassConstructorNameConfig
    extends CodeConfigNode<CodeClassConstructorName> {
  CodeClassConstructorNameConfig(
      NodeBuildFunc<CodeClassConstructorName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConstructorNameConfig.of(StringFunc func, Node child) =>
      CodeClassConstructorNameConfig(
          (context, name) => TextTransform(name.content, func), child);

  factory CodeClassConstructorNameConfig.forJavaLike(Node child) =>
      // Java does not allow named constructor, skip it.
      CodeClassConstructorNameConfig.of(StringFuncs.noop, child);

  factory CodeClassConstructorNameConfig.forDartLike(Node child) =>
      CodeClassConstructorNameConfig((context, name) {
        final field =
            context.findAncestorNodeOfExactType<CodeClassConstructor>();
        final modifier = field?.modifier;

        Node res = TextTransform(name.content, StringFuncs.camel);

        if (modifier?.private == true ||
            modifier?.protected == true ||
            modifier?.internal == true) {
          // Add '_' prefix for non public field.
          res = Pad.left('_', res);
        }

        return res;
      }, child);
}

class CodeClassConstructorName
    extends CodeConfigProxyNode<CodeClassConstructorName> {
  final Node content;

  CodeClassConstructorName._(this.content);

  static CodeClassConstructorName of(dynamic name) => _parseNode(name, (v) {
        if (name is Node) return CodeClassConstructorName._(name);
        return CodeClassConstructorName._(Text.of(name));
      });
}
