part of g3.stimpack.meta_new.generated;



class StimMetaNewPackXPresetsSetOp extends StimSymbolSetOpImpl<StimMetaNewPack, StimMetaNewPackSet, StimMetaNewPreset, StimMetaNewPresetSet> {
  StimMetaNewPackXPresetsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewPresetScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewPack child, StimMetaNewPresetSet values) {
    child.presets = values;
  }

  @override
  void onAdd(StimMetaNewPack child, StimMetaNewPresetSet values) {
    child.presets += values;
  }
}
