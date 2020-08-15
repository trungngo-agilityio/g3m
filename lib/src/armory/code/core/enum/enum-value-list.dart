part of g3.armory;

class CodeEnumValueListConfig extends CodeConfigNode<CodeEnumValueList> {
  CodeEnumValueListConfig(
      NodeBuildFunc<CodeEnumValueList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumValueListConfig.forJavaLike(Node child) =>
      CodeEnumValueListConfig((context, param) {
        final children = param.args;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Join.of(',\n', children);
      }, child);
}

class CodeEnumValueList extends CodeConfigProxyNode<CodeEnumValueList> {
  final List<CodeEnumValue> args;

  CodeEnumValueList._(this.args);

  factory CodeEnumValueList.of(List<CodeEnumValue> values) =>
      values?.isNotEmpty == true ? CodeEnumValueList._(values) : null;
}
