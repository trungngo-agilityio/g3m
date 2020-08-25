part of g3.stimpack.model;

class _StimField_TypeOp extends StimSymbolOpImpl<_StimField, _StimFieldSet,
    _StimType, _StimTypeSet> {
  _StimField_TypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<_StimType, _StimTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(_StimField child, _StimType value) {
    child.type = value;
  }
}

class _StimField_TypeSetOp extends StimSymbolSetOpImpl<_StimField,
    _StimFieldSet, _StimType, _StimTypeSet> {
  _StimField_TypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<_StimType, _StimTypeSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(_StimField child, _StimTypeSet values) {
    child.types += values;
  }

  @override
  void onSet(_StimField child, _StimTypeSet values) {
    child.types = values;
  }
}
