part of g3.stimpack.model.generated;



class StimModelFieldXTypeOp extends StimSymbolOpImpl<StimModelField, StimModelFieldSet, StimModelType, StimModelTypeSet> {
  StimModelFieldXTypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelTypeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelField child, StimModelType values) {
    child.type = values;
  }
}
