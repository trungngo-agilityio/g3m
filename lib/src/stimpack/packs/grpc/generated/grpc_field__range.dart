part of g3.stimpack.grpc.generated;



class StimModelFieldXRangeSetOp extends StimSymbolSetOpImpl<StimModelField, StimModelFieldSet, StimModelRange, StimModelRangeSet> {
  StimModelFieldXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelField child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimModelField child, StimModelRangeSet values) {
    child.range += values;
  }
}
