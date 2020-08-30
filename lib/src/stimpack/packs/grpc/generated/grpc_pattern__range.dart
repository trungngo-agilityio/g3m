part of g3.stimpack.grpc.generated;



class StimModelPatternXRangeSetOp extends StimSymbolSetOpImpl<StimModelPattern, StimModelPatternSet, StimModelRange, StimModelRangeSet> {
  StimModelPatternXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelPattern child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimModelPattern child, StimModelRangeSet values) {
    child.range += values;
  }
}
