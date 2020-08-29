part of g3.stimpack.model.generated;

class StimModelRuleXPatternsSetOp extends StimSymbolSetOpImpl<StimModelRule, StimModelRuleSet, StimModelPattern, StimModelPatternSet> {
  StimModelRuleXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelPattern, StimModelPatternSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimModelRule child, StimModelPatternSet values) {
    child.patterns += values;
  }

  @override
  void onSet(StimModelRule child, StimModelPatternSet values) {
    child.patterns = values;
  }
}
    