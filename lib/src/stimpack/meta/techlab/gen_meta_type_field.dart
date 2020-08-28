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
      'part of g3.stimpack.${pack.name.camel()}.generated;\n',
      field.kind == stimpack.meta.kind.s.list
          ? _buildListField()
          : _buildSingleField(),
    ]);
  }

  Node _buildSingleField() {
    final template = '''

    
class {{ setOpClass }} extends StimSymbolOpImpl<{{ setOpClassGeneric }}> {
  {{ setOpClass }}(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<{{ fieldTypeClass}}, {{ fieldTypeSetClass }}> scope)
      : super(symbols, scope);

  @override
  void onSet({{ typeClass }} child, {{ fieldTypeClass }} value) {
    child.{{ fieldName.camel }} = value;
  }
}
    ''';
    return _buildTemplate(template);
  }

  Node _buildListField() {
    final template = '''

class {{ setOpClass }} extends StimSymbolSetOpImpl<{{ setOpClassGeneric }}> {
  {{ setOpClass }}(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<{{ fieldTypeClass }}, {{ fieldTypeSetClass }}> scope)
      : super(symbols, scope);

  @override
  void onAdd({{ typeClass }} child, {{ fieldTypeSetClass }} values) {
    child.{{ fieldName.camel }} += values;
  }

  @override
  void onSet({{ typeClass }} child, {{ fieldTypeSetClass }} values) {
    child.{{ fieldName.camel }} = values;
  }
}
    ''';
    return _buildTemplate(template);
  }

  Node _buildTemplate(String template) {
    return StimGenMetaTemplate(template, null,
        pack: pack, type: type, field: field);
  }
}
