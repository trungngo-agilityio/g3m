part of g3.stimpack2.meta.techlab;

CodeProperty _lazyInitCodeProperty(CodeField field) {
  return CodeProperty.of(
    name: 'ref',
    type: field.type,
    getter: CodePropertyGetter.of(
      body: CodeReturn.of(
        CodeAssignIfNullExpr.of(
          CodeRef.of(field),
          CodeConstructorCall.of(
            className: field.type.name,
          ),
        ),
      ),
    ),
  );
}

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
