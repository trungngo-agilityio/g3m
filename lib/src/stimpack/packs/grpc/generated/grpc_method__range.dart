part of g3.stimpack.grpc.generated;



class StimGrpcMethodXRangeSetOp extends StimSymbolSetOpImpl<StimGrpcMethod, StimGrpcMethodSet, StimModelRange, StimModelRangeSet> {
  StimGrpcMethodXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethod child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimGrpcMethod child, StimModelRangeSet values) {
    child.range += values;
  }
}
