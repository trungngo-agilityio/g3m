part of g3.stimpack.meta;

class _StimMetaType_FieldSetOp extends StimSymbolSetOpImpl<StimMetaType,
    _StimMetaTypeSet, StimMetaField, _StimMetaFieldSet> {
  _StimMetaType_FieldSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaField, _StimMetaFieldSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimMetaType child, _StimMetaFieldSet items) {
    child.fields += items;
  }

  @override
  void onSet(StimMetaType child, _StimMetaFieldSet items) {
    child.fields = items;
  }
}
