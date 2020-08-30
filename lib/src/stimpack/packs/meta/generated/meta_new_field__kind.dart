part of g3.stimpack.meta_new.generated;



class StimMetaNewFieldXKindOp extends StimSymbolOpImpl<StimMetaNewField, StimMetaNewFieldSet, StimMetaNewKind, StimMetaNewKindSet> {
  StimMetaNewFieldXKindOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewKindScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewField child, StimMetaNewKind values) {
    child.kind = values;
  }
}
