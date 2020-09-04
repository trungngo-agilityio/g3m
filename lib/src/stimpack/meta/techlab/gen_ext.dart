part of g3.stimpack.meta.techlab;

class StimGenMetaExt implements Node {
  final StimModelPackage pack;

  final Map<StimModelType, Set<String>> externalValues;

  StimGenMetaExt(this.pack, this.externalValues);

  StimpackCodeConfig _config;

  @override
  Node build(BuildContext context) {
    _config = context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();
    final fileName = _config.packExtFileNameOf(pack).toString();

    final classes = <CodeClass>[];
    final extensions = <CodeExtension>[];

    if (externalValues?.isNotEmpty == true) {
      for (final e in externalValues.entries) {
        final type = e.key;
        final values = e.value;

        if (values?.isNotEmpty != null) {
          classes.add(_buildClassDef(type, values));
          extensions.add(_buildExtensionDef(type));
        }
      }
    }

    return DartCodeFile.of(
      fileName,
      package: _config.codePackageLibraryOf(pack, isPart: true),
      classes: classes,
      extensions: extensions,
    );
  }

  CodeClass _buildClassDef(StimModelType type, Set<String> values) {
    final className = _config.valueExtClassName(pack, type);
    final fields = <CodeField>[];

    for (final v in values) {
      final typeName = _config.symbolClassNameOf(type);
      fields.add(CodeField.of(name: v.camelCase, type: typeName));
    }

    return CodeClass.of(name: className, fields: fields);
  }

  CodeExtension _buildExtensionDef(StimModelType type) {
    final className = _config.valueExtClassName(pack, type);
    final fieldName = _config.valueExtFieldName(pack, type);

    final prop = CodeProperty.of(
      name: pack.name,
      type: className,
      getter: CodePropertyGetter.of(
        body: Container([
          CodeComment.of('Gets the type meta through stimpack public '
              'instance to trigger lazy init of the pack.'),
          CodeReturn.of(
            CodeAccessExpr.of(
                'stimpack.${pack.name.camel()}', CodeRef.of(fieldName)),
          )
        ]),
      ),
    );

    return CodeExtension.of(
      name: _config.valueExtExtensionName(pack, type),
      on: _config.scopeClassNameOf(type),
      properties: [prop],
    );
  }
}
