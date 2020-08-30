part of g3.stimpack.grpc.generated;



class StimModelRangeXPatternsSetOp extends StimSymbolSetOpImpl<StimModelRange, StimModelRangeSet, StimModelPattern, StimModelPatternSet> {
  StimModelRangeXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelRange child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimModelRange child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
