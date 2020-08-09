part of g3.armory;


class CodeClass implements Node {
  final String name;
  final bool abstract;
  final bool interface;
  final CodeAccess access;
  final List<CodeField> fields;
  final List<CodeFunction> functions;
  final String extend;
  final List<String> implement;
  final List<CodeAnnotation> annotations;
  final Node comment;

  CodeClass(
      this.name, {
        this.abstract,
        this.interface,
        this.access,
        this.fields,
        this.functions,
        this.extend,
        this.implement,
        this.annotations,
        this.comment,
      });

  @override
  Node build(BuildContext context) {
    return Container([
      CodeComment(comment),
      Container(annotations),
      Text('interface ${name} {'),
      NewLine(),
      CodeBlock(
        Container([
          ...fields,
          NewLine(),
          ...functions,
        ]),
      ),
      NewLine(),
      Text('}'),
      NewLine(),
    ]);
  }
}

