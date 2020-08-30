part of g3.stimpack.grpc.generated;



class StimModelFieldXPatternsSetOp extends StimSymbolSetOpImpl<StimModelField, StimModelFieldSet, StimModelPattern, StimModelPatternSet> {
  StimModelFieldXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelField child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimModelField child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
