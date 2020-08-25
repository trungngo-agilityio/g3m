part of g3.stimpack.model;

class _StimType_FieldSetOp extends StimSymbolSetOpImpl<StimType, _StimTypeSet,
    StimMetaField, _StimFieldSet> {
  _StimType_FieldSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaField, _StimFieldSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimType child, _StimFieldSet items) {
    child.fields += items;
  }

  @override
  void onSet(StimType child, _StimFieldSet items) {
    child.fields = items;
  }
}
