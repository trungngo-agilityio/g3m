part of g3.armory;

class CodeClassNameConfig extends CodeConfigNode<CodeClassName> {
  CodeClassNameConfig(NodeBuildFunc<CodeClassName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassNameConfig.of(StringFunc func, Node child) =>
      CodeClassNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeClassNameConfig.forJavaLike(Node child) =>
      CodeClassNameConfig.of(StringFuncs.pascal, child);

  factory CodeClassNameConfig.forDartLike(Node child) =>
      CodeClassNameConfig((context, name) {
        final clazz = context.findAncestorNodeOfExactType<CodeClass>();
        final modifier = clazz?.modifier;

        Node res = TextTransform(name.name, StringFuncs.pascal);

        if (modifier?.private == true ||
            modifier?.protected == true ||
            modifier?.internal == true) {
          // Add '_' prefix for non public clazz.
          res = Pad.left('_', res);
        }

        return res;
      }, child);
}

class CodeClassName extends CodeConfigProxyNode<CodeClassName>
    implements NamedNode {
  @override
  final Node name;

  CodeClassName._(this.name);

  factory CodeClassName.of(dynamic value) {
    return _parseNode<CodeClassName>(value, (v) {
      // Try to parse the value as the expression name.
      final name = NamedNode.nameOf(v);
      assert(name != null, 'class name must not be null');
      return CodeClassName._(name);
    }, error: () {
      throw '${value} is not a valid argument.';
    });
  }
}
