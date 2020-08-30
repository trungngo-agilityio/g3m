part of g3.stimpack.meta_new.generated;



class StimMetaNewTypeXPresetsSetOp extends StimSymbolSetOpImpl<StimMetaNewType, StimMetaNewTypeSet, StimMetaNewPreset, StimMetaNewPresetSet> {
  StimMetaNewTypeXPresetsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewPresetScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewType child, StimMetaNewPresetSet values) {
    child.presets = values;
  }

  @override
  void onAdd(StimMetaNewType child, StimMetaNewPresetSet values) {
    child.presets += values;
  }
}
