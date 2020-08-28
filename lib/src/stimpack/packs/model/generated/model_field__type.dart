part of g3.stimpack.model.generated;

    
class StimModelFieldXTypeSetOp extends StimSymbolOpImpl<StimModelField, StimModelFieldSet, StimModelType, StimModelTypeSet> {
  StimModelFieldXTypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelType, StimModelTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimModelField child, StimModelType value) {
    child.type = value;
  }
}
    