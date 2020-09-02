part of g3.stimpack.meta.generated;

class StimMetaTypeXValuesSetOp extends StimSymbolSetOpImpl<StimMetaType,
    StimMetaTypeSet, StimMetaValue, StimMetaValueSet> {
  StimMetaTypeXValuesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimMetaValueScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaType child, StimMetaValueSet values) {
    child.values = values;
  }

  @override
  void onAdd(StimMetaType child, StimMetaValueSet values) {
    child.values += values;
  }
}
