part of g3.stimpack.meta.techlab;

class StimGenMetaTypeField implements Node {
  final StimMetaPack pack;
  final StimMetaType type;
  final StimMetaField field;

  StimGenMetaTypeField(this.pack, this.type, this.field);

  @override
  Node build(BuildContext context) {
    final config =
        context.dependOnAncestorNodeOfExactType<StimpackCodeConfig>();

    final fileName = config.typeFieldFileNameOf(pack, type, field);
    return DartCodeFile.of(fileName, body: _buildBody());
  }

  Node _buildBody() {
    return Container([
      CodePackage.partOf(pack.name, path: ['g3', 'stimpack']),
      field.kind == stimpack.meta.kind.list
          ? _buildListField()
          : _buildSingleField(),
    ]);
  }

  Node _buildSingleField() {
    final template = '''

    
class _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}Op extends StimSymbolOpImpl<Stim{{ packNamePascal }}{{ typeNamePascal }},
    Stim{{ packNamePascal }}{{ typeNamePascal }}Set, Stim{{ packNamePascal }}{{ fieldTypePascal }}, Stim{{ packNamePascal }}{{ fieldTypePascal }}Set> {
  _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}Op(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<Stim{{ packNamePascal }}{{ fieldTypePascal }}, Stim{{ packNamePascal }}{{ fieldTypePascal }}Set> scope)
      : super(symbols, scope);

  @override
  void onSet(Stim{{ packNamePascal }}{{ typeNamePascal }} child, Stim{{ packNamePascal }}{{ fieldTypePascal }} value) {
    child.{{ fieldNameCamel }} = value;
  }
}
    ''';
    return _buildTemplate(template);
  }

  Node _buildListField() {
    final template = '''

class _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}SetOp extends StimSymbolSetOpImpl<Stim{{ packNamePascal }}{{ typeNamePascal }},
    Stim{{ packNamePascal }}{{ typeNamePascal }}Set, Stim{{ packNamePascal }}{{ fieldTypePascal }}, Stim{{ packNamePascal }}{{ fieldTypePascal }}Set> {
  _Stim{{ packNamePascal }}{{ typeNamePascal }}_{{ fieldTypePascal }}SetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<Stim{{ packNamePascal }}{{ fieldTypePascal }}, Stim{{ packNamePascal }}{{ fieldTypePascal }}Set> scope)
      : super(symbols, scope);

  @override
  void onAdd(Stim{{ packNamePascal }}{{ typeNamePascal }} child, Stim{{ packNamePascal }}{{ fieldTypePascal }}Set values) {
    child.{{ fieldNameCamel }} += values;
  }

  @override
  void onSet(Stim{{ packNamePascal }}{{ typeNamePascal }} child, Stim{{ packNamePascal }}{{ fieldTypePascal }}Set values) {
    child.{{ fieldNameCamel }} = values;
  }
}
    ''';
    return _buildTemplate(template);
  }

  Node _buildTemplate(String template) {
    return Mustache.template(template, values: {
      'packNamePascal': pack.name.pascal(),
      'packNameCamel': pack.name.camel(),
      'typeNamePascal': type.name.pascal(),
      'typeNameCamel': type.name.camel(),
      'fieldNamePascal': field.name.pascal(),
      'fieldNameCamel': field.name.camel(),
      'fieldTypePascal': field.type.name.pascal(),
      'fieldTypeCamel': field.type.name.camel(),
    });
  }
}
