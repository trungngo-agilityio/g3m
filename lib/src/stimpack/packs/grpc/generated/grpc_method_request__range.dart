part of g3.stimpack.grpc.generated;



class StimGrpcMethodRequestXRangeSetOp extends StimSymbolSetOpImpl<StimGrpcMethodRequest, StimGrpcMethodRequestSet, StimModelRange, StimModelRangeSet> {
  StimGrpcMethodRequestXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethodRequest child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimGrpcMethodRequest child, StimModelRangeSet values) {
    child.range += values;
  }
}
