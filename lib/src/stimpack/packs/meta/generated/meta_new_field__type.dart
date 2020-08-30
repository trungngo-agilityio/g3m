part of g3.stimpack.meta_new.generated;



class StimMetaNewFieldXTypeOp extends StimSymbolOpImpl<StimMetaNewField, StimMetaNewFieldSet, StimMetaNewType, StimMetaNewTypeSet> {
  StimMetaNewFieldXTypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewTypeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewField child, StimMetaNewType values) {
    child.type = values;
  }
}
