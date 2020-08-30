part of g3.stimpack.meta_new.generated;



class StimMetaNewTypeXPackOp extends StimSymbolOpImpl<StimMetaNewType, StimMetaNewTypeSet, StimMetaNewPack, StimMetaNewPackSet> {
  StimMetaNewTypeXPackOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewPackScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewType child, StimMetaNewPack values) {
    child.pack = values;
  }
}
