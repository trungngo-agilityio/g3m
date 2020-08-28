part of g3.stimpack.meta.generated;

class StimMetaTypeXFieldsSetOp extends StimSymbolSetOpImpl<StimMetaType, StimMetaTypeSet, StimMetaField, StimMetaFieldSet> {
  StimMetaTypeXFieldsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaField, StimMetaFieldSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimMetaType child, StimMetaFieldSet values) {
    child.fields += values;
  }

  @override
  void onSet(StimMetaType child, StimMetaFieldSet values) {
    child.fields = values;
  }
}
    