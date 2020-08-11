part of g3.armory;

class CodePackageName extends SingleChildNode {
  CodePackageName(Node child) : super(CodeName(child));

  factory CodePackageName.of(String name) => CodePackageName(Text(name));
}
