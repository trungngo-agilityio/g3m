part of g3.stimpack.meta.techlab;

class StimGenMetaTemplate implements Node {
  static const _stim = 'stim';
  final String template;
  final Map<String, dynamic> templateValues;
  final StimMetaPack pack;
  final StimMetaKind kind;
  final StimMetaType type;
  final StimMetaField field;
  final StimMetaPreset preset;
  final StimMetaValue value;

  StimGenMetaTemplate(
    this.template,
    this.templateValues, {
    @required this.pack,
    this.kind,
    this.type,
    this.field,
    this.preset,
    this.value,
  }) : assert(pack != null);

  @override
  Node build(BuildContext context) {
    final values = <String, dynamic>{};
    final symbols = <String, StimSymbol>{
      'pack': pack,
      'kind': kind,
      'type': type,
      'field': field,
      'fieldType': field?.type,
      'preset': preset,
      'value': value,
    };
    _addSymbols(values, symbols);

    if (type != null && field != null) {
      values['setOpClass'] =
          (_stim >> pack.name >> type.name >> 'x' >> field.name >> 'set op')
              .pascal();

      final typeClass = values['typeClass'] as Name;
      final typeSetClass = values['typeSetClass'] as Name;
      final fieldTypeClass = values['fieldTypeClass'] as Name;
      final fieldTypeSetClass = values['fieldTypeSetClass'] as Name;

      // The generic part of set operations class.
      values['setOpClassGeneric'] = [
        typeClass.pascal(),
        typeSetClass.pascal(),
        fieldTypeClass.pascal(),
        fieldTypeSetClass.pascal(),
      ].join(', ');
    }

    values.addAll(templateValues ?? {});
    return Mustache.template(template, values: values);
  }

  void _addSymbols(
      Map<String, dynamic> values, Map<String, StimSymbol> symbols) {
    for (final i in symbols.entries) {
      if (i.value != null) {
        values[i.key] = i.value;
        _add(values, i.key, i.value.name);
      }
    }
  }

  void _add(Map<String, dynamic> values, String k, Name n) {
    final prefix = _stim >> pack.name;
    values[k + 'Name'] = n.pascal();
    values[k + 'Class'] = (n << prefix).pascal();
    values[k + 'ImplClass'] = (n << prefix << '_' >> 'impl').pascal();
    values[k + 'ExtensionClass'] = (n << prefix >> 'extension').pascal();
    values[k + 'SymbolClass'] = (n << prefix).pascal();
    values[k + 'SetClass'] = (n << prefix >> 'set').pascal();
    values[k + 'SymbolsClass'] = (n << prefix >> 'symbols').pascal();
    values[k + 'ScopeClass'] = (n << prefix >> 'scope').pascal();
    values[k + 'ScopeImplClass'] =
        (n << prefix << '_' >> 'scope impl').pascal();
  }
}
