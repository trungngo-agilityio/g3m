part of g3.stimpack.grpc.generated;



class StimGrpcMethodResponseXPatternsSetOp extends StimSymbolSetOpImpl<StimGrpcMethodResponse, StimGrpcMethodResponseSet, StimModelPattern, StimModelPatternSet> {
  StimGrpcMethodResponseXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethodResponse child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimGrpcMethodResponse child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
