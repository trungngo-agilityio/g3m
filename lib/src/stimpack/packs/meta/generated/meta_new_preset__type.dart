part of g3.stimpack.meta_new.generated;



class StimMetaNewPresetXTypeOp extends StimSymbolOpImpl<StimMetaNewPreset, StimMetaNewPresetSet, StimMetaNewType, StimMetaNewTypeSet> {
  StimMetaNewPresetXTypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewTypeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewPreset child, StimMetaNewType values) {
    child.type = values;
  }
}
