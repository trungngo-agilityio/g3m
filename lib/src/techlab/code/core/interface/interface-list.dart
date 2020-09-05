part of g3.techlab;

class CodeInterfaceListConfig extends CodeConfigNode<CodeInterfaceList> {
  CodeInterfaceListConfig(
      NodeBuildFunc<CodeInterfaceList> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeInterfaceListConfig.forJavaLike(Node child) =>
      CodeInterfaceListConfig((context, param) {
        final children = param.interfaces;
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

class CodeInterfaceList extends CodeConfigProxyNode<CodeInterfaceList> {
  final List<CodeInterface> interfaces;

  CodeInterfaceList._(this.interfaces);

  factory CodeInterfaceList.of(List<CodeInterface> interfaces) =>
      interfaces?.isNotEmpty == true ? CodeInterfaceList._(interfaces) : null;
}
