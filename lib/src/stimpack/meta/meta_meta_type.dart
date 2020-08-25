part of g3.stimpack.meta;

class _StimMetaPack_TypeSetOp extends StimSymbolSetOpImpl<StimMetaPack,
    _StimMetaPackSet, StimMetaType, _StimMetaTypeSet> {
  _StimMetaPack_TypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaType, _StimMetaTypeSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimMetaPack child, _StimMetaTypeSet values) {
    child.types += values;
  }

  @override
  void onSet(StimMetaPack child, _StimMetaTypeSet values) {
    child.types = values;
  }
}
