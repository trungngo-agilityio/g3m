part of g3.armory;

class CodeClassImplementListConfig
    extends CodeConfigNode<CodeClassImplementList> {
  CodeClassImplementListConfig(
      NodeBuildFunc<CodeClassImplementList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassImplementListConfig.forJavaLike(
    Node child, {
    String implementsKeyword = 'implements',
  }) =>
      CodeClassImplementListConfig((context, param) {
        final types = param.types;
        if (types == null || types.isEmpty) {
          return null;
        }

        return Container([
          Text(implementsKeyword),
          Text.space(),
          Join.commaSeparated(types),
        ]);
      }, child);
}

class CodeClassImplementList
    extends CodeConfigProxyNode<CodeClassImplementList> {
  final List<CodeClassImplement> types;

  CodeClassImplementList(this.types);

  factory CodeClassImplementList.single(String type) =>
      CodeClassImplementList([CodeClassImplement.simple(type)]);

  factory CodeClassImplementList.list(List<String> types) =>
      CodeClassImplementList(
          types?.map((type) => CodeClassImplement.simple(type))?.toList());
}
