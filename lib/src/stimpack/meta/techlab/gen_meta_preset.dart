part of g3.stimpack.meta.techlab;

class StimGenMetaPreset implements Node {
  final StimMetaPack pack;

  StimpackCodeConfig _config;

  StimGenMetaPreset(this.pack);

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = _config.presetFileNameOf(pack);

    return DartCodeFile.of(
      fileName,
      package: _config.codePackageLibraryOf(pack, isPart: true),
      classes: _presetClassListDef(),
      body: presetExtensionList(),
    );
  }

  List<CodeClass> _presetClassListDef() {
    return pack.presets.map((e) => _presetClassDef(e)).toList();
  }

  CodeClass _presetClassDef(StimMetaPreset preset) {
    final type = preset.type;
    assert(type != null);

    final className = _config.presetClassNameOf(pack, preset);
    final allField = CodeField.of(
        name: 'all', type: _config.symbolSetClassNameOf(pack, type));
    final allFieldRef = CodeRef.of(allField);

    final fields = <CodeField>[allField];

    final scopeArg = CodeArg.of(
      name: 'scope',
      type: _config.scopeClassNameOf(pack, type),
    );

    final initBody = <Node>[
      CodeAssignExpr.of(
        allFieldRef,
        CodeAccessExpr.of(
          CodeRef.of(scopeArg),
          CodeRef.of('noneSet'),
        ),
      )
    ];

    for (final i in preset.values) {
      final field = CodeField.of(
          name: i.name, type: _config.symbolClassNameOf(pack, type));
      fields.add(field);

      // initializes the field with a symbol with just name.
      final initField = CodeAssignExpr.of(
        CodeRef.of(field),
        CodeAccessExpr.of(
          scopeArg.name,
          CodeFunctionCall.of(name: 'of', args: CodeStringLiteral.of(i.name)),
        ),
      );

      // add the field to the all field.
      final init = CodePlusAssignExpr.of(allFieldRef, initField);
      initBody.add(init);
    }

    final initFunction = CodeFunction.of(
        name: 'init',
        returns: CodeType.ofVoid(),
        requiredArgs: [scopeArg],
        body: initBody);

    return CodeClass.of(
      name: className,
      fields: fields,
      functions: [initFunction],
    );
  }

  Node _presetExtension(StimMetaPreset preset) {
    final template = ''' 
extension {{ className }}Extension on {{ scopeClassName }} {
  {{ className }} get {{ presetName }} {
    final impl = stimpack.{{ packName }} as {{ packImpl }};
    return impl._{{ presetFieldName }}; 
  }
}
    ''';
    final type = preset.type;
    final publicScope = _config.publicTypeScopeOf(pack, type);
    final scopeClassName = _config.scopeClassNameOf(pack, type);

    return Mustache.template(template, values: {
      'packName': pack.name,
      'packImpl': _config.packImplClassNameOf(pack),
      'presetFieldName': _config.presetFieldNameOf(pack, preset),
      'className': _config.presetClassNameOf(pack, preset),
      'presetName': _config.publicPresetName(pack, preset),
      'scopeClassName': scopeClassName,
      'publicScope': publicScope,
    });
  }

  Node presetExtensionList() {
    final children = pack.presets.map((e) => _presetExtension(e));
    return Join.newLineSeparated(children);
  }
}
