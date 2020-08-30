part of g3.stimpack.grpc.generated;



class StimModelRuleXRangeSetOp extends StimSymbolSetOpImpl<StimModelRule, StimModelRuleSet, StimModelRange, StimModelRangeSet> {
  StimModelRuleXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelRule child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimModelRule child, StimModelRangeSet values) {
    child.range += values;
  }
}
