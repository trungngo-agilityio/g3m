part of g3.armory;

class CodeClassExtendListConfig extends CodeConfigNode<CodeClassExtendList> {
  CodeClassExtendListConfig(
      NodeBuildFunc<CodeClassExtendList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassExtendListConfig.commaSeparated(Node child) =>
      CodeClassExtendListConfig((context, param) {
        final types = param.types;
        if (types == null || types.isEmpty) {
          return null;
        }

        return Join.commaSeparated(types);
      }, child);
}

class CodeClassExtendList extends CodeConfigProxyNode<CodeClassExtendList> {
  final List<CodeClassExtend> types;

  CodeClassExtendList(this.types);

  factory CodeClassExtendList.single(String type) =>
      CodeClassExtendList([CodeClassExtend.simple(type)]);

  factory CodeClassExtendList.list(List<String> types) => CodeClassExtendList(
      types?.map((type) => CodeClassExtend.simple(type))?.toList());
}