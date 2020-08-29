part of g3.stimpack.model.generated;

    
class StimModelRuleXRangeSetOp extends StimSymbolOpImpl<StimModelRule, StimModelRuleSet, StimModelRange, StimModelRangeSet> {
  StimModelRuleXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelRange, StimModelRangeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimModelRule child, StimModelRange value) {
    child.range = value;
  }
}
    