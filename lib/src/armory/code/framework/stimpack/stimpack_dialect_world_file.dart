part of g3.armory.stimpack;

class StimpackWorldFile implements Node {
  StimpackWorldFile();

  StimpackDialect _dialect;

  @override
  Node build(BuildContext context) {
    _dialect = context.dependOnAncestorNodeOfExactType<StimpackDialect>();

    return DartCodeFile.of(
      'world',
      package: _dialect.codePackagePart(),
      classes: [
        CodeClass.of(
          name: _dialect.codeWorldClassName(),
          fields: _makeFields(),
          properties: _makeProperties(),
          constructors: _makeDefaultConstructor(),
        ),
      ],
    );
  }

  List<CodeField> _makeFields() {
    return _dialect.models
        .map((e) => CodeField.of(
              name: e.name,
              type: e.name + ' scope',
              isPrivate: true,
            ))
        .toList();
  }

  List<CodeProperty> _makeProperties() {
    return _dialect.models.map((e) {
      return CodeProperty.of(
        name: e.name,
        type: e.name + ' scope',
        getter: 'return _${e.name.camel()};',
      );
    }).toList();
  }

  Node _makeDefaultConstructor() {
    final body = _dialect.models.map((e) {
      var fieldName = e.name.camel();
      var scopeClassName = _dialect.codeScopeClassName(e.name.toString());

      return Container([
        '_',
        fieldName,
        ' = ',
        scopeClassName,
        '(this);\n',
      ]);
    }).toList();

    return CodeConstructor.of(body: Container(body));
  }
}
