part of g3.stimpack.grpc.generated;



class StimModelRangeXRangeSetOp extends StimSymbolSetOpImpl<StimModelRange, StimModelRangeSet, StimModelRange, StimModelRangeSet> {
  StimModelRangeXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelRange child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimModelRange child, StimModelRangeSet values) {
    child.range += values;
  }
}
