part of g3.armory;

class CodeFunctionThrowListConfig
    extends CodeConfigNode<CodeFunctionThrowList> {
  CodeFunctionThrowListConfig(
      NodeBuildFunc<CodeFunctionThrowList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeFunctionThrowListConfig.ignored(Node child) =>
      CodeFunctionThrowListConfig(null, child);

  factory CodeFunctionThrowListConfig.forJavaLike(Node child) =>
      CodeFunctionThrowListConfig((context, param) {
        final types = param.types;
        if (types == null || types.isEmpty) {
          return null;
        }

        return TextTransform(Join.commaSeparated(types), (s) {
          s = s?.trim();
          if (s?.isNotEmpty == true) s = ' throws ' + s;
          return s;
        });
      }, child);
}

class CodeFunctionThrowList extends CodeConfigProxyNode<CodeFunctionThrowList> {
  final List<CodeFunctionThrow> types;

  CodeFunctionThrowList(this.types);

  factory CodeFunctionThrowList.single(String type) =>
      CodeFunctionThrowList([CodeFunctionThrow.simple(type)]);

  factory CodeFunctionThrowList.list(List<String> types) =>
      CodeFunctionThrowList(
          types?.map((type) => CodeFunctionThrow.simple(type))?.toList());
}
