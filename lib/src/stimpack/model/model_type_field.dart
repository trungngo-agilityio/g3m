part of g3.stimpack.model;

class _StimType_FieldSetOp extends StimSymbolSetOpImpl<_StimType, _StimTypeSet,
    _StimField, _StimFieldSet> {
  _StimType_FieldSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<_StimField, _StimFieldSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(_StimType child, _StimFieldSet items) {
    child.fields += items;
  }

  @override
  void onSet(_StimType child, _StimFieldSet items) {
    child.fields = items;
  }
}
