part of g3.stimpack.grpc.generated;



class StimModelPatternXPatternsSetOp extends StimSymbolSetOpImpl<StimModelPattern, StimModelPatternSet, StimModelPattern, StimModelPatternSet> {
  StimModelPatternXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelPattern child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimModelPattern child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
