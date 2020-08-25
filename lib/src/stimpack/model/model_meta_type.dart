part of g3.stimpack.model;

class _StimPack_TypeSetOp extends StimSymbolSetOpImpl<StimPack,
    _StimPackSet, StimType, _StimTypeSet> {
  _StimPack_TypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimType, _StimTypeSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimPack child, _StimTypeSet values) {
    child.types += values;
  }

  @override
  void onSet(StimPack child, _StimTypeSet values) {
    child.types = values;
  }
}
