part of g3.stimpack.meta.generated;



class StimMetaTypeXPackOp extends StimSymbolOpImpl<StimMetaType, StimMetaTypeSet, StimMetaPack, StimMetaPackSet> {
  StimMetaTypeXPackOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaPackScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaType child, StimMetaPack values) {
    child.pack = values;
  }
}
