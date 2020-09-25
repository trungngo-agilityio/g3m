part of g3.stimpack.meta.techlab;


Node _cascadeMultiCodeLine(dynamic first, List<dynamic> children) {
  return Container([
    first,
    '\n',
    Indent(
      Join.newLineSeparated(children.map((e) => CodeCascade.of(e))),
      level: 2,
    ),
  ]);
}
