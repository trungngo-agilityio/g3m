part of g3.stimpack.meta_new.generated;



class StimMetaNewPresetXValuesSetOp extends StimSymbolSetOpImpl<StimMetaNewPreset, StimMetaNewPresetSet, StimMetaNewValue, StimMetaNewValueSet> {
  StimMetaNewPresetXValuesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewValueScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewPreset child, StimMetaNewValueSet values) {
    child.values = values;
  }

  @override
  void onAdd(StimMetaNewPreset child, StimMetaNewValueSet values) {
    child.values += values;
  }
}
