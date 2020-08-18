part of g3.armory;

class CodeEnumValueNameConfig extends CodeConfigNode<CodeEnumValueName> {
  CodeEnumValueNameConfig(
      NodeBuildFunc<CodeEnumValueName> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumValueNameConfig.of(StringFunc func, Node child) =>
      CodeEnumValueNameConfig(
          (context, name) => TextTransform(name.name, func), child);

  factory CodeEnumValueNameConfig.forDartLike(Node child) =>
      CodeEnumValueNameConfig.of(StringFuncs.camel, child);

  factory CodeEnumValueNameConfig.forJavaLike(Node child) =>
      CodeEnumValueNameConfig.of(StringFuncs.constant, child);
}

/// Defines a name for [CodeEnumValue] element.
///
class CodeEnumValueName extends CodeConfigProxyNode<CodeEnumValueName>
    implements NamedNode {
  @override
  final Node name;

  CodeEnumValueName._(this.name);

  static CodeEnumValueName _parse(dynamic value, {_NodeParseErrorFunc error}) {
    // Try to parse the input as the enum name itself.
    return _parseNode<CodeEnumValueName>(value, (v) {
      // Try to parse the input as the name expression.
      final name = NamedNode.nameOf(v);

      // Don't accept null
      if (name == null) return null;
      return CodeEnumValueName._(name);
    }, error: error);
  }

  factory CodeEnumValueName.of(dynamic value) =>
      CodeEnumValueName._parse(value, error: () {
        throw '$value is not a valid enum value name';
      });
}
