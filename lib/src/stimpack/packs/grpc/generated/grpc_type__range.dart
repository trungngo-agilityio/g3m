part of g3.stimpack.grpc.generated;



class StimModelTypeXRangeSetOp extends StimSymbolSetOpImpl<StimModelType, StimModelTypeSet, StimModelRange, StimModelRangeSet> {
  StimModelTypeXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelType child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimModelType child, StimModelRangeSet values) {
    child.range += values;
  }
}
