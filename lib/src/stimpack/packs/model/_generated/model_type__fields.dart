part of g3.stimpack.model;

class _StimModelType_FieldSetOp extends StimSymbolSetOpImpl<StimModelType,
    StimModelTypeSet, StimModelField, StimModelFieldSet> {
  _StimModelType_FieldSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
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
    