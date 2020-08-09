part of g3.armory;

class CodeField implements Node {
  final CodeDataType type;
  final String name;

  CodeField(this.type, this.name);

  @override
  Node build(BuildContext context) {
    return Container([
      type,
      Text(name),
    ]);
  }
}
