part of g3.stimpack.meta.techlab;

class StimGenMetaType implements Node {
  final StimMetaPack pack;
  final StimMetaType type;

  Name _symbolClassName,
      _symbolSetClassName,
      _scopeClassName,
      _scopeImplClassName;

  CodeArg _scopeImplArg;

  StimpackCodeConfig _config;

  StimGenMetaType(this.pack, this.type);

  @override
  Node build(BuildContext context) {
    _initCommonFields(context);

    final fileName = _config.typeFileNameOf(pack, type);

    return DartCodeFile.of(
      fileName,
      package: _config.codePackageLibraryOf(pack, isPart: true),
      classes: [
        _symbolClassDef(),
        _symbolSetClassDef(),
        _abstractScopeClassDef(),
        _implementScopeClassDef(),
      ],
    );
  }

  void _initCommonFields(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();

    // The symbol definition class
    _symbolClassName = _config.symbolClassNameOf(pack, type);

    // The symbol set definition class
    _symbolSetClassName = _config.symbolSetClassNameOf(pack, type);

    // The abstract scope class
    _scopeClassName = _config.scopeClassNameOf(pack, type);

    // The implementation scope class
    _scopeImplClassName = _config.scopeImplClassNameOf(pack, type);

    _scopeImplArg = CodeArg.of(
      name: 'scope',
      type: _config.scopeImplClassNameOf(pack, type),
    );
  }

  CodeClass _symbolClassDef() {
    final baseSymbolClass = CodeType.of(
        name: 'stim symbol', generic: [_symbolClassName, _symbolSetClassName]);

    final fields = <CodeField>[];
    final fieldCloneList = <Node>[];

    for (final field in type.fields) {
      final fieldClass = _config.fieldSymbolOrSetNameOf(pack, field);
      fields.add(CodeField.of(name: field.name, type: fieldClass));

      fieldCloneList.add(
        CodeCascade.of(
          CodeAssignExpr.of(
            field.name,
            CodeAccessExpr.of(
              field.name,
              CodeFunctionCall.of(name: 'clone'),
            ),
          ),
        ),
      );
    }

    // Creates a constructor that accepts a scope argument.
    final constructor = CodeConstructor.of(
      requiredArgs: _scopeImplArg,
      init: CodeFunctionCall.of(name: 'super', args: CodeRef.of(_scopeImplArg)),
    );

    final cloneFunctionBody = CodeReturn.of(Container([
      'super.clone()\n',
      Indent(Join.newLineSeparated(fieldCloneList), level: 2),
    ]));

    final cloneFunction = CodeFunction.of(
      name: 'clone',
      isOverride: true,
      returns: _symbolClassName,
      body: cloneFunctionBody,
    );

    return CodeClass.of(
      name: _symbolClassName,
      extend: baseSymbolClass,
      fields: fields,
      constructors: constructor,
      functions: [cloneFunction],
    );
  }

  CodeClass _symbolSetClassDef() {
    final baseSymbolSetClass = CodeType.of(
        name: 'stim symbol set',
        generic: [_symbolClassName, _symbolSetClassName]);

    // Build fields and properties
    final scopeField = CodeField.of(
        name: 'scope',
        type: _scopeImplClassName,
        isPrivate: true,
        isFinal: true);
    final fields = <CodeField>[scopeField];
    final properties = <CodeProperty>[];

    for (final i in type.fields) {
      final opClass = _config.fieldOpOrSetOpNameOf(pack, type, i);
      final field = CodeField.of(name: i.name, type: opClass, isPrivate: true);
      final fieldTypeScope = _config.publicTypeScopeOf(pack, i.type);

      final property = CodeProperty.of(
        name: i.name,
        type: field.type,
        getter: CodeReturn.of(
          CodeAssignIfNullExpr.of(
            field.name,
            CodeConstructorCall.of(
              className: opClass,
              args: [
                CodeRef.ofThis(),
                CodeRef.of(fieldTypeScope),
              ],
            ),
          ),
        ),
        setter: CodeAssignExpr.of(
          CodeRef.of(field),
          CodeRef.of('value'),
        ),
      );

      fields.add(field);
      properties.add(property);
    }

    // Builds constructor

    final scopeFieldArg = CodeArg.ofField(field: scopeField);
    final itemsArg = _symbolListArgs();

    final constructor = CodeConstructor.of(
      requiredArgs: [
        scopeFieldArg,
        itemsArg,
      ],
      init: CodeFunctionCall.ofSuper(args: [
        scopeFieldArg.name,
        CodeRef.of(itemsArg),
      ]),
    );

    return CodeClass.of(
      name: _symbolSetClassName,
      extend: baseSymbolSetClass,
      fields: fields,
      properties: properties,
      constructors: constructor,
    );
  }

  CodeArg _symbolListArgs() {
    return CodeArg.of(
        name: 'items',
        type: CodeType.of(
          name: _symbolClassName,
          array: true,
        ));
  }

  CodeClass _abstractScopeClassDef() {
    final baseScopeClass = CodeType.of(
        name: 'stim scope', generic: [_symbolClassName, _symbolSetClassName]);

    final properties = <CodeProperty>[];
    final ofFunction = _scopeClassOfFunction();

    for (final value in type.values) {
      final property = CodeProperty.of(
        name: value.name,
        type: _symbolClassName,
        getter: CodePropertyGetter.of(body: null),
      );
      properties.add(property);
    }

    return CodeClass.of(
      name: _scopeClassName,
      extend: baseScopeClass,
      isAbstract: true,
      properties: properties,
      functions: [ofFunction],
    );
  }

  CodeFunction _scopeClassOfFunction({Node body}) {
    final ofFunctionArgs = <CodeArg>[];
    for (final i in type.fields) {
      ofFunctionArgs.add(CodeArg.of(name: i.name.camel(), type: 'dynamic'));
    }

    return CodeFunction.of(
      name: 'of',
      returns: _symbolClassName,
      requiredArgs: 'name',
      namedArgs: ofFunctionArgs,
      isOverride: body != null,
      body: body,
    );
  }

  CodeClass _implementScopeClassDef() {
    final baseScopeImplClass = CodeType.of(
        name: 'stim scope impl',
        generic: [_symbolClassName, _symbolSetClassName]);

    final fields = <CodeField>[];
    final properties = <CodeProperty>[];

    final clearFunctionFields = <Node>[];
    final ofFunctionFields = <Node>[];

    for (final value in type.values) {
      final field = CodeField.of(
          name: value.name, type: _symbolClassName, isPrivate: true);
      fields.add(field);

      final property = CodeProperty.of(
        name: field.name,
        type: field.type,
        isOverride: true,
        getter: CodePropertyGetter.of(
          body: CodeReturn.of(
            CodeAssignIfNullExpr.of(
              CodeRef.of(field),
              CodeFunctionCall.of(
                name: 'of',
                args: CodeStringLiteral.of(value.name),
              ),
            ),
          ),
        ),
      );
      properties.add(property);
    }

    for (final field in type.fields) {
      final fieldClass = _config.fieldSymbolOrSetNameOf(pack, field);

      fields.add(CodeField.of(name: field.name, type: fieldClass));

      final fieldRef = CodeRef.of(field);
      final none = CodeAccessExpr.of(
        CodeRef.of(_config.publicTypeScopeOf(pack, field.type)),
        Text.of(field.isSet ? 'noneSet' : 'none'),
      );

      clearFunctionFields.add(
        CodeCascade.of(
          CodeAssignExpr.of(field.name, none),
        ),
      );

      final lazyField = CodeConditionalNullExpr.of(fieldRef, none);
      ofFunctionFields.add(
        CodeCascade.of(
          field.isSet
              ? CodePlusAssignExpr.of(field.name, lazyField)
              : CodeAssignExpr.of(field.name, lazyField),
        ),
      );
    }

    // -------------------------------------------------------------------------
    // Builds constructors
    final constructor = CodeConstructor.of(
      init: CodeFunctionCall.ofSuper(),
    );

    // -------------------------------------------------------------------------
    // Build functions
    // -------------------------------------------------------------------------

    final ofFunction = _scopeClassOfFunction(
      body: CodeExpr.of(
        Container([
          'return createAndClear(name)\n',
          Indent(Join.newLineSeparated(ofFunctionFields), level: 2),
        ]),
      ),
    );

    // -------------------------------------------------------------------------
    // Generates a function that clear all properties of a symbol.
    //

    final clearFunction = CodeFunction.of(
      name: 'clear',
      isOverride: true,
      returns: CodeType.ofVoid(),
      requiredArgs: CodeArg.of(name: 'symbol', type: _symbolClassName),
      body: CodeExpr.of(
        Container([
          'symbol\n',
          Indent(Join.newLineSeparated(clearFunctionFields), level: 2),
        ]),
      ),
    );

    // -------------------------------------------------------------------------
    // Generates a function that create a new symbol for the current scope.
    final createFunction = CodeFunction.of(
      name: 'create',
      isOverride: true,
      returns: _symbolClassName,
      body: CodeReturn.of(
        CodeConstructorCall.of(
          className: _symbolClassName,
          args: CodeRef.ofThis(),
        ),
      ),
    );

    // -------------------------------------------------------------------------
    // Generates a function that creates a symbol set from a specified list
    // of symbols.
    final symbolListArgs = _symbolListArgs();
    final createSetFunction = CodeFunction.of(
      name: 'create set',
      isOverride: true,
      returns: _symbolSetClassName,
      requiredArgs: symbolListArgs,
      body: CodeReturn.of(CodeConstructorCall.of(
        className: _symbolSetClassName,
        args: [
          CodeRef.ofThis(),
          CodeRef.of(symbolListArgs),
        ],
      )),
    );

    final functions = <CodeFunction>[
      ofFunction,
      clearFunction,
      createFunction,
      createSetFunction,
    ];

    // -------------------------------------------------------------------------
    // Build class
    // -------------------------------------------------------------------------
    return CodeClass.of(
      name: _scopeImplClassName,
      extend: baseScopeImplClass,
      implements: _scopeClassName,
      fields: fields,
      properties: properties,
      constructors: constructor,
      functions: functions,
    );
  }
}
