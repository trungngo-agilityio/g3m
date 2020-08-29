part of g3.stimpack.meta.generated;



class StimMetaTypeXPresetsSetOp extends StimSymbolSetOpImpl<StimMetaType, StimMetaTypeSet, StimMetaPreset, StimMetaPresetSet> {
  StimMetaTypeXPresetsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaPresetScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaType child, StimMetaPresetSet values) {
    child.presets = values;
  }

  @override
  void onAdd(StimMetaType child, StimMetaPresetSet values) {
    child.presets += values;
  }
}
