part of g3.stimpack.meta.generated;

class StimMetaPackXPresetsSetOp extends StimSymbolSetOpImpl<StimMetaPack,
    StimMetaPackSet, StimMetaPreset, StimMetaPresetSet> {
  StimMetaPackXPresetsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimMetaPresetScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaPack child, StimMetaPresetSet values) {
    child.presets = values;
  }

  @override
  void onAdd(StimMetaPack child, StimMetaPresetSet values) {
    child.presets += values;
  }
}
