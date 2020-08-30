part of g3.stimpack.grpc.generated;



class StimGrpcServiceXPatternsSetOp extends StimSymbolSetOpImpl<StimGrpcService, StimGrpcServiceSet, StimModelPattern, StimModelPatternSet> {
  StimGrpcServiceXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcService child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimGrpcService child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
