part of g3.stimpack.grpc.generated;



class StimGrpcMessageXRangeSetOp extends StimSymbolSetOpImpl<StimGrpcMessage, StimGrpcMessageSet, StimModelRange, StimModelRangeSet> {
  StimGrpcMessageXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMessage child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimGrpcMessage child, StimModelRangeSet values) {
    child.range += values;
  }
}
