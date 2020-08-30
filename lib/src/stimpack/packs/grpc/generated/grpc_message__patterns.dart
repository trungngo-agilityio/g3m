part of g3.stimpack.grpc.generated;



class StimGrpcMessageXPatternsSetOp extends StimSymbolSetOpImpl<StimGrpcMessage, StimGrpcMessageSet, StimModelPattern, StimModelPatternSet> {
  StimGrpcMessageXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMessage child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimGrpcMessage child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
