part of g3.stimpack.model.generated;

class StimModelTypeXFieldsSetOp extends StimSymbolSetOpImpl<StimModelType, StimModelTypeSet, StimModelField, StimModelFieldSet> {
  StimModelTypeXFieldsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelField, StimModelFieldSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimModelType child, StimModelFieldSet values) {
    child.fields += values;
  }

  @override
  void onSet(StimModelType child, StimModelFieldSet values) {
    child.fields = values;
  }
}
    