part of g3.stimpack.meta_new.generated;



class StimMetaNewTypeXFieldsSetOp extends StimSymbolSetOpImpl<StimMetaNewType, StimMetaNewTypeSet, StimMetaNewField, StimMetaNewFieldSet> {
  StimMetaNewTypeXFieldsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaNewFieldScope scope):
      super(symbols, scope);


  @override
  void onSet(StimMetaNewType child, StimMetaNewFieldSet values) {
    child.fields = values;
  }

  @override
  void onAdd(StimMetaNewType child, StimMetaNewFieldSet values) {
    child.fields += values;
  }
}
