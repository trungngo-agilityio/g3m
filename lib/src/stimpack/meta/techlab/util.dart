part of g3.stimpack.meta.techlab;


CodeProperty _lazyInitCodeProperty(CodeField field,
    {CodeRef instance, Node createFunc}) {
  Node fieldRef = CodeRef.of(field);
  if (instance != null) {
    fieldRef = CodeAccessExpr.of(instance, fieldRef);
  }

  createFunc ??= CodeConstructorCall.of(className: field.type.name);
  return CodeProperty.of(
    name: field.name,
    type: field.type,
    getter: CodePropertyGetter.of(
      body: CodeReturn.of(
        CodeAssignIfNullExpr.of(
          fieldRef,
          createFunc,
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
