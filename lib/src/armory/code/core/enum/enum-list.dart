part of g3.armory;

class CodeEnumListConfig extends CodeConfigNode<CodeEnumList> {
  CodeEnumListConfig(NodeBuildFunc<CodeEnumList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumListConfig.forJavaLike(Node child) =>
      CodeEnumListConfig((context, param) {
        final children = param.enums;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container([
          '\n',
          Join.newLineSeparated(children),
        ]);
      }, child);
}

class CodeEnumList extends CodeConfigProxyNode<CodeEnumList> {
  final List<CodeEnum> enums;

  CodeEnumList._(this.enums);

  factory CodeEnumList.of(List<CodeEnum> enums) =>
      enums?.isNotEmpty == true ? CodeEnumList._(enums) : null;
}
