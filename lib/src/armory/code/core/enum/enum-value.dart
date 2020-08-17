part of g3.armory;

class CodeEnumValueConfig extends CodeConfigNode<CodeEnumValue> {
  CodeEnumValueConfig(NodeBuildFunc<CodeEnumValue> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeEnumValueConfig.forJavaLike(Node child) =>
      CodeEnumValueConfig((context, field) {
        return Container([
          field.comment,
          field.name,
          field.init != null ? Container([' = ', field.init]) : null,
        ]);
      }, child);
}

class CodeEnumValue extends CodeConfigProxyNode<CodeEnumValue>
    implements NamedNode {
  @override
  final CodeEnumValueName name;
  final OldCodeExpr init;
  final CodeComment comment;

  CodeEnumValue({
    this.name,
    this.init,
    this.comment,
  });

  factory CodeEnumValue.of(
    String name, {
    dynamic init,
    String comment,
  }) =>
      CodeEnumValue(
        name: CodeEnumValueName.of(name),
        init: init != null ? OldCodeExpr.of(init) : null,
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
