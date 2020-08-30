part of g3.stimpack.grpc.generated;



class StimGrpcServiceXRangeSetOp extends StimSymbolSetOpImpl<StimGrpcService, StimGrpcServiceSet, StimModelRange, StimModelRangeSet> {
  StimGrpcServiceXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcService child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimGrpcService child, StimModelRangeSet values) {
    child.range += values;
  }
}
