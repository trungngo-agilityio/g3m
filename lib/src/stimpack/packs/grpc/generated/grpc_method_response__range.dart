part of g3.stimpack.grpc.generated;



class StimGrpcMethodResponseXRangeSetOp extends StimSymbolSetOpImpl<StimGrpcMethodResponse, StimGrpcMethodResponseSet, StimModelRange, StimModelRangeSet> {
  StimGrpcMethodResponseXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethodResponse child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimGrpcMethodResponse child, StimModelRangeSet values) {
    child.range += values;
  }
}
