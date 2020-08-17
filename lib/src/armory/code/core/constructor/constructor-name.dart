part of g3.armory;

class CodeConstructorNameConfig extends CodeConfigNode<CodeConstructorName> {
  CodeConstructorNameConfig(
      NodeBuildFunc<CodeConstructorName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeConstructorNameConfig.of(StringFunc func, Node child) =>
      CodeConstructorNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeConstructorNameConfig.forJavaLike(Node child) =>
      // Java does not allow named constructor, skip it.
      CodeConstructorNameConfig.of(StringFuncs.noop, child);

  factory CodeConstructorNameConfig.forDartLike(Node child) =>
      CodeConstructorNameConfig((context, name) {
        final field = context.findAncestorNodeOfExactType<CodeConstructor>();
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

class CodeConstructorName extends CodeConfigProxyNode<CodeConstructorName>
    implements NamedNode {
  @override
  final Node name;

  CodeConstructorName._(this.name);

  static CodeConstructorName of(dynamic value) {
    // Try to parse the input as the constructor name itself.
    return _parseNode<CodeConstructorName>(value, (v) {
      // Try to parse the input as the constructor name expression.
      final name = NamedNode.nameOf(v);

      // Accepts the name, even null value.
      return CodeConstructorName._(name);
    }, error: () {
      throw '$value is not a valid constructor';
    });
  }
}
