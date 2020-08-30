part of g3.stimpack.grpc.generated;



class StimGrpcMethodRequestXPatternsSetOp extends StimSymbolSetOpImpl<StimGrpcMethodRequest, StimGrpcMethodRequestSet, StimModelPattern, StimModelPatternSet> {
  StimGrpcMethodRequestXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethodRequest child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimGrpcMethodRequest child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
