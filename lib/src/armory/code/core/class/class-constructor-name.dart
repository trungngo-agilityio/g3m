part of g3.armory;

class CodeClassConstructorNameConfig
    extends CodeConfigNode<CodeClassConstructorName> {
  CodeClassConstructorNameConfig(
      NodeBuildFunc<CodeClassConstructorName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassConstructorNameConfig.of(StringFunc func, Node child) =>
      CodeClassConstructorNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeClassConstructorNameConfig.forJavaLike(Node child) =>
      // Java does not allow named constructor, skip it.
      CodeClassConstructorNameConfig.of(StringFuncs.noop, child);

  factory CodeClassConstructorNameConfig.forDartLike(Node child) =>
      CodeClassConstructorNameConfig((context, name) {
        final field =
            context.findAncestorNodeOfExactType<CodeClassConstructor>();
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

class CodeClassConstructorName
    extends CodeConfigProxyNode<CodeClassConstructorName> implements NamedNode {
  @override
  final Node name;

  CodeClassConstructorName._(this.name);

  static CodeClassConstructorName of(dynamic value) {
    // Try to parse the input as the constructor name itself.
    return _parseNode<CodeClassConstructorName>(value, (v) {
      // Try to parse the input as the constructor name expression.
      final name = NamedNode.nameOf(v);

      // Accepts the name, even null value.
      return CodeClassConstructorName._(name);
    }, error: () {
      throw '$value is not a valid constructor';
    });
  }
}
