part of g3.stimpack.model.generated;



class StimModelRuleXRangeOp extends StimSymbolOpImpl<StimModelRule, StimModelRuleSet, StimModelRange, StimModelRangeSet> {
  StimModelRuleXRangeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelRule child, StimModelRange values) {
    child.range = values;
  }
}
