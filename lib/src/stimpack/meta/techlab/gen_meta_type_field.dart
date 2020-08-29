part of g3.stimpack.meta.techlab;

class StimGenMetaTypeField implements Node {
  final StimMetaPack pack;
  final StimMetaType type;
  final StimMetaField field;

  StimpackCodeConfig _config;

  StimGenMetaTypeField(this.pack, this.type, this.field);

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();

    final fileName = _config.typeFieldFileNameOf(pack, type, field);
    return DartCodeFile.of(
      fileName,
      package: _config.codePackageLibraryOf(pack, isPart: true),
      classes: [_classDef()],
    );
  }

  CodeClass _classDef() {
    final className = _config.fieldOpOrSetOpNameOf(pack, type, field);
    final isSet = field.isSet;
    final baseClassName =
        isSet ? 'stim symbol set op impl' : 'stim symbol op impl';

    final symbolClassName = _config.symbolClassNameOf(pack, type);
    final fieldSymbolClassName = _config.symbolClassNameOf(pack, field.type);
    final fieldSymbolSetClassName =
        _config.symbolSetClassNameOf(pack, field.type);

    final baseClass = CodeType.of(name: baseClassName, generic: [
      symbolClassName,
      _config.symbolSetClassNameOf(pack, type),
      fieldSymbolClassName,
      fieldSymbolSetClassName,
    ]);

    final symbolSetArgs = CodeArg.of(
        name: 'symbols',
        type: CodeType.of(name: 'stim symbol set', generic: [
          'stim symbol',
          'stim symbol set',
        ]));

    final scopeArgs = CodeArg.of(
        name: 'scope', type: _config.scopeClassNameOf(pack, field.type));

    final constructor = CodeConstructor.of(
        requiredArgs: [symbolSetArgs, scopeArgs],
        init: CodeFunctionCall.ofSuper(args: [
          CodeRef.of(symbolSetArgs),
          CodeRef.of(scopeArgs),
        ]));

    final childArg = CodeArg.of(name: 'child', type: symbolClassName);
    final childArgRef = CodeRef.of(childArg);

    final valueArgType = isSet ? fieldSymbolSetClassName : fieldSymbolClassName;
    final valuesArg = CodeArg.of(name: 'values', type: valueArgType);
    final valuesArgRef = CodeRef.of(valuesArg);

    final childDotValues =
        CodeAccessExpr.of(childArgRef, CodeRef.of(field.name.camel()));

    final onSetFunction = CodeFunction.of(
        name: 'on set',
        returns: CodeType.ofVoid(),
        requiredArgs: [childArg, valuesArg],
        isOverride: true,
        body: CodeAssignExpr.of(childDotValues, valuesArgRef));

    final functions = <CodeFunction>[onSetFunction];

    if (isSet) {
      final onAddFunction = CodeFunction.of(
          name: 'on add',
          returns: CodeType.ofVoid(),
          requiredArgs: [childArg, valuesArg],
          isOverride: true,
          body: CodePlusAssignExpr.of(childDotValues, valuesArgRef));
      functions.add(onAddFunction);
    }

    return CodeClass.of(
      name: className,
      extend: baseClass,
      functions: functions,
      constructors: constructor,
    );
  }
}
