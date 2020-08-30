part of g3.stimpack.grpc.generated;



class StimModelTypeXPatternsSetOp extends StimSymbolSetOpImpl<StimModelType, StimModelTypeSet, StimModelPattern, StimModelPatternSet> {
  StimModelTypeXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelType child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimModelType child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
