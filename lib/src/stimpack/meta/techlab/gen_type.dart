part of g3.stimpack.meta.techlab;

class StimGenMetaType implements Node {
  final StimModelPackage pack;

  final StimModelType type;

  /// The values attached to the type via a meta tag.
  final Set<String> metaValues;

  StimModelField _tagSetField;
  Set<StimModelType> _metaInterfaces;
  Set<StimModelField> _metaFields;

  StimName _stimNameClass,
      _symbolClassName,
      _scopeClassName,
      _simplifiedSymbolName;

  StimpackCodeConfig _config;

  StimGenMetaType(this.pack, this.type, this.metaValues);

  @override
  Node build(BuildContext context) {
    _initCommonFields(context);

    final fileName = _config.typeFileNameOf(pack, type);

    return DartCodeFile.of(
      fileName,
      package: _config.codeGeneratedPackageLibraryOf(pack, isPart: true),
      classes: [
        _symbolClassDef(),
        _symbolScopeClassDef(),
      ],
    );
  }

  void _initCommonFields(BuildContext context) {
    final t = stimpack.model.type.model, f = stimpack.model.field;

    _metaInterfaces = type.interfaces ?? {};
    _metaFields = type.fields ?? {};
    _tagSetField = f.of(name: 'tags', type: t.tagSet);

    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();

    _stimNameClass = StimName.of('stim name').pascal();
    _symbolClassName = _config.symbolClassNameOf(type);
    _scopeClassName = _config.scopeClassNameOf(type);
    _simplifiedSymbolName = _config.fieldNameSimplified(pack, type.name);
  }

  CodeClass _symbolClassDef() {
    final baseSymbolClass = CodeType.of(
      name: 'stim model symbol',
      generic: [
        _symbolClassName,
      ],
    );

    final interfaces = <CodeType>{};
    for (final interface in _metaInterfaces) {
      interfaces.add(
        CodeType.of(name: interface.name),
      );
    }
    final fields = <CodeField>{};
    for (final field in _metaFields) {
      fields.add(
        CodeField.of(
          name: field.name,
          type: field.type.name,
          comment: field.comment,
        ),
      );
    }

    return CodeClass.of(
      name: _symbolClassName,
      extend: baseSymbolClass,
      implements: interfaces.isEmpty ? null : interfaces.toList(),
      fields: fields.toList(),
      comment: type.comment,
      functions: [
        _symbolCopyWithFunction(),
      ],
      constructors: CodeConstructor.of(),
    );
  }

  CodeFunction _symbolCopyWithFunction() {
    Node nameRef = CodeRef.of('name');

    // Copy the dynamic input name, and covert it to a stim name.
    Node existingValue = CodeAccessExpr.of(CodeRef.ofThis(), nameRef);

    Node nameAssign = CodeAssignExpr.of(
        nameRef,
        CodeConstructorCall.of(
          className: _stimNameClass,
          name: 'of',
          args: CodeConditionalNullExpr.of(nameRef, existingValue),
        ));

    // Copies all input arguments to the symbol.
    final argsAssign = <Node>[];

    for (final field in _metaFields + _tagSetField) {
      final name = field.name.camel();

      // This is the value assigned to the field.
      // In the case of dart set and list data type, we inits
      // the field with existingValue set/list to avoid null check.
      Node value = CodeRef.of(name);
      Node existingValue = CodeAccessExpr.of(CodeRef.ofThis(), value);
      value = CodeConditionalNullExpr.of(CodeRef.of(name), existingValue);

      argsAssign.add(CodeAssignExpr.of(name, value));
    }

    final assignList = [
      nameAssign,
      ...argsAssign,
    ];

    return _createSymbolFunction(
      'copyWith',
      addRequired: true,
      comment:
          '''Creates a new "${_simplifiedSymbolName}" of [$_symbolClassName] type.''',
      body: CodeReturn.of(
        _cascadeMultiCodeLine(
          CodeConstructorCall.of(className: _symbolClassName),
          assignList,
        ),
      ),
    );
  }

  CodeClass _symbolScopeClassDef() {
    final fields = <CodeField>[];

    if (metaValues?.isNotEmpty == true) {
      for (final value in metaValues) {
        final field = CodeField.of(
          name: value,
          type: _symbolClassName,
        );
        fields.add(field);
      }
    }

    return CodeClass.of(
      name: _scopeClassName,
      fields: fields,
      functions: [_scopeClassOfFunction()],
    );
  }

  CodeFunction _scopeClassOfFunction() {
    final nameRef = CodeRef.of('name');

    // Copy the dynamic input name, and covert it to a stim name.
    final nameAssign = CodeAssignExpr.of(
        nameRef,
        CodeConstructorCall.of(
            className: _stimNameClass, name: 'of', args: nameRef));

    // Copies all input arguments to the symbol.
    final argsAssign = <Node>[];

    for (final field in _metaFields + _tagSetField) {
      final name = field.name.camel();

      // This is the value assigned to the field.
      // In the case of dart set and list data type, we inits
      // the field with empty set/list to avoid null check.
      Node value = CodeRef.of(name);
      if (field.type.isCollection) {
        Node empty;
        if (field.type.isDartSet) {
          empty = CodeSetLiteral.empty();
        } else if (field.type.isDartList) {
          empty = CodeArrayLiteral.empty();
        }

        if (empty != null) {
          value = CodeConditionalNullExpr.of(value, empty);
        }
      }

      argsAssign.add(CodeAssignExpr.of(name, value));
    }

    final assignList = [
      nameAssign,
      ...argsAssign,
    ];

    final ofFunction = _createSymbolFunction(
      'of',
      addRequired: true,
      comment:
          '''Creates a new "${_simplifiedSymbolName}" of [$_symbolClassName] type.''',
      body: CodeReturn.of(
        _cascadeMultiCodeLine(
          CodeConstructorCall.of(className: _symbolClassName),
          assignList,
        ),
      ),
    );
    return ofFunction;
  }

  CodeFunction _createSymbolFunction(String functionName,
      {Node body, String comment, bool addRequired}) {
    final ofFunctionArgs = <CodeArg>[
      CodeArg.of(
        name: 'name',
        type: 'dynamic',
        annotations: addRequired == true ? CodeAnnotation.required() : null,
      ),
    ];

    for (final i in _metaFields + _tagSetField) {
      final required = addRequired == true && i.isRequired
          ? CodeAnnotation.required()
          : null;

      ofFunctionArgs.add(
        CodeArg.of(
          name: i.name.camel(),
          type: i.type.name,
          annotations: required,
        ),
      );
    }

    return CodeFunction.of(
      name: functionName,
      returns: _symbolClassName,
      namedArgs: ofFunctionArgs,
      body: body,
      comment:
          '''Creates a new "${_simplifiedSymbolName}" of [$_symbolClassName] type.''',
    );
  }
}
