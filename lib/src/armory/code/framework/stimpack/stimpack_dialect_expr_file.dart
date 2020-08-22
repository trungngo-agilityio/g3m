part of g3.armory.stimpack;

class StimpackExprFile implements Node {
  final Model model;

  String _fileName;
  String _name;

  Set<Field> _allFields;
  Set<Field> _exprFields;

  StimpackCodeConfig _config;
  StimpackDialect _dialect;

  StimpackExprFile(this.model) : assert(model != null);

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    _dialect = context.dependOnAncestorNodeOfExactType<StimpackDialect>();

    _fileName = model.name.snake().toString();
    _name = model.name.toString();
    _allFields = model.fields.eval();

    _exprFields =
        _allFields.where((e) => !_config.isPrimitiveType(e.type)).toSet();

    return DartCodeFile.of(
      _fileName,
      package: _dialect.codePackagePart(),
      classes: [
        _exprClass(),
        _scopeClass(),
      ],
    );
  }

  Node _exprClass() {
    final exprFields = _allFields.map(
      (e) {
        var fieldName = e.name.toString();
        var fieldType = e.type.name.toString();

        var field =
            CodeField.of(name: fieldName, type: fieldType, isPrivate: true);
        var fieldRef = CodeRef.of(field);

        var iVar = CodeVar.of(name: 'i', isFinal: true);
        var iVarRef = CodeRef.of(iVar);

        var valueRef = Text.of('value');
        return Container([
          field,
          CodeProperty.of(
            name: field,
            type: fieldType,
            getter: CodeReturn.of(fieldRef),
            setter: [
              // _author = value;
              CodeAssignExpr.of(fieldRef, valueRef),

              _config.isPrimitiveType(e.type)
                  ? null

                  // assert(value != null, 'value is required')
                  : CodeFunctionCall.of(
                      name: 'assert',
                      args: [
                        CodeNotEqualExpr.of(valueRef, CodeNullLiteral()),
                        'value is required'
                      ],
                    ),

              // for (var i in eval()) {
              CodeForEach.of(
                item: iVar,
                collection: CodeFunctionCall.of(name: 'eval'),
                body: Container([
                  // i._author = value;
                  CodeAssignExpr.of(
                    CodeAccessExpr.of(iVarRef, fieldRef),
                    valueRef,
                  ),
                ]),
              ),
            ],
          ),
        ]);
      },
    ).toList();

    final worldField = _makeWorldField();
    final className = CodeClassName.of(_name);
    final scopeField = CodeFieldName.of(name: className);

    // class Package extends Expr<Package>
    return CodeClass.of(
        name: className,
        extend: CodeType.genericSingle('expr', _name),

        // Package(this.world):
        //    super(world.package);
        constructors: CodeConstructor.of(
          requiredArgs: worldField,
          init: CodeFunctionCall.of(name: 'super', args: [
            Container(['world.', scopeField]),
          ]),
        ),
        fields: worldField,
        body: [
          ...exprFields,
          CodeCustom(
            CodeComment.of('implement custom code here'),
          ),
        ]);
  }

  CodeField _makeWorldField() {
    return CodeField.of(
      name: 'world',
      isFinal: true,
      type: _dialect.codeWorldClassName(),
    );
  }

  CodeClass _scopeClass() {
    final worldField = _makeWorldField();

    Node makeFields = Join.newLineSeparated(_exprFields.map((e) {
      final fieldName = CodeFieldName.of(name: e.name);
      return Container([
        CodeCascade.of(fieldName),
        ' = world.',
        fieldName,
        '.none',
      ]);
    })?.toList());

    Node copyFields = Join.newLineSeparated(_allFields.map((e) {
      final fieldName = CodeFieldName.of(name: e.name);
      return Container([
        CodeCascade.of(fieldName),
        ' = ',
        fieldName,
      ]);
    })?.toList());

    final makeFunction = CodeFunction.of(
      name: 'make',
      isOverride: true,
      returns: _name,
      body: CodeReturn.of(Container(
        [
          _dialect.codeExprClassName(_name),
          '(',
          worldField.name,
          ')\n',
          Indent(makeFields, level: 2),
        ],
      )),
    );

    var typedArgs = _allFields.map((e) => [e.name, e.type])?.toList();
    final callFunction = CodeFunction.of(
      name: 'call',
      returns: _name,
      namedArgs: typedArgs,
      body: CodeReturn.of(Container(
        [
          'add(null)\n',
          Indent(copyFields, level: 2),
        ],
      )),
    );

    return CodeClass.of(
      name: _dialect.codeScopeClassName(_name),
      extend: CodeType.genericSingle('scope', _name),
      constructors: CodeConstructor.of(requiredArgs: worldField),
      fields: worldField,
      functions: [
        makeFunction,
        callFunction,
      ],
    );
  }
}
