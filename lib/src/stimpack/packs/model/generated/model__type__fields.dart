part of g3.stimpack.model.generated;

class StimModelTypeXFieldsSetOp extends StimSymbolSetOpImpl<StimModelType,
    StimModelTypeSet, StimModelField, StimModelFieldSet> {
  StimModelTypeXFieldsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelFieldScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimModelType child, StimModelFieldSet values) {
    child.fields = values;
  }

  @override
  void onAdd(StimModelType child, StimModelFieldSet values) {
    child.fields += values;
  }
}
