part of g3.armory;

class CodeVarConfig extends CodeConfigNode<CodeVar> {
  CodeVarConfig(NodeBuildFunc<CodeVar> buildFunc, Node child)
      : super(buildFunc, child);

  factory CodeVarConfig.typeThenName(Node child) =>
      CodeVarConfig((context, field) {
        return CodeStatement(Container([
          field.comment,
          field.type,
          Text.space(),
          field.name,
        ]));
      }, child);

  factory CodeVarConfig.nameThenType(Node child) =>
      CodeVarConfig((context, field) {
        return CodeStatement(Container([
          field.comment,
          field.name,
          Text.space(),
          field.type,
        ]));
      }, child);
}

class CodeVar extends CodeConfigProxyNode<CodeVar> {
  final CodeVarName name;
  final CodeType type;
  final bool isFinal;
  final CodeComment comment;

  CodeVar({
    this.name,
    this.isFinal,
    this.type,
    this.comment,
  });

  factory CodeVar.of(
          {String name, String type, String comment, bool isFinal}) =>
      CodeVar(
        name: CodeVarName.of(name),
        type: CodeType.simple(type),
        comment: comment != null ? CodeComment.of(comment) : null,
      );
}
