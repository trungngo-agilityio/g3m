part of g3.stimpack.meta_new.generated;



class StimMetaNewPackXTypesSetOp extends StimSymbolSetOpImpl<StimMetaNewPack, StimMetaNewPackSet, StimMetaNewType, StimMetaNewTypeSet> {
  StimMetaNewPackXTypesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewTypeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewPack child, StimMetaNewTypeSet values) {
    child.types = values;
  }

  @override
  void onAdd(StimMetaNewPack child, StimMetaNewTypeSet values) {
    child.types += values;
  }
}
