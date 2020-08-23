part of g3.techlab;

class CodeClassListConfig extends CodeConfigNode<CodeClassList> {
  CodeClassListConfig(NodeBuildFunc<CodeClassList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeClassListConfig.forJavaLike(Node child) =>
      CodeClassListConfig((context, param) {
        final children = param.classes;
        if (children == null || children.isEmpty) {
          return null;
        }

        return Container([
          NewLine(),
          NewLine(),
          Join.newLineSeparated(children),
        ]);
      }, child);
}

class CodeClassList extends CodeConfigProxyNode<CodeClassList> {
  final List<CodeClass> classes;

  CodeClassList._(this.classes);

  factory CodeClassList.of(List<CodeClass> classes) =>
      classes?.isNotEmpty == true ? CodeClassList._(classes) : null;
}
