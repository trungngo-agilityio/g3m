part of g3.stimpack.model.generated;



class StimModelRuleXPatternsSetOp extends StimSymbolSetOpImpl<StimModelRule, StimModelRuleSet, StimModelPattern, StimModelPatternSet> {
  StimModelRuleXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelRule child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimModelRule child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
