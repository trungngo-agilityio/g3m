part of g3.stimpack.model;

    
class _StimModelField_TypeOp extends StimSymbolOpImpl<StimModelField,
    StimModelFieldSet, StimModelType, StimModelTypeSet> {
  _StimModelField_TypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelType, StimModelTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimModelField child, StimModelType value) {
    child.type = value;
  }
}
    