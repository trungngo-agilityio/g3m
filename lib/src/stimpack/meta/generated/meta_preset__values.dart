part of g3.stimpack.meta.generated;

class StimMetaPresetXValuesSetOp extends StimSymbolSetOpImpl<StimMetaPreset,
    StimMetaPresetSet, StimMetaValue, StimMetaValueSet> {
  StimMetaPresetXValuesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaValue, StimMetaValueSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimMetaPreset child, StimMetaValueSet values) {
    child.values += values;
  }

  @override
  void onSet(StimMetaPreset child, StimMetaValueSet values) {
    child.values = values;
  }
}
