part of g3.stimpack.grpc.generated;



class StimGrpcMethodXPatternsSetOp extends StimSymbolSetOpImpl<StimGrpcMethod, StimGrpcMethodSet, StimModelPattern, StimModelPatternSet> {
  StimGrpcMethodXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethod child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimGrpcMethod child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
