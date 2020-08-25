part of g3.stimpack.model;

class _StimModelType_RuleSetOp extends StimSymbolSetOpImpl<StimModelType,
    StimModelTypeSet, StimModelRule, StimModelRuleSet> {
  _StimModelType_RuleSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelRule, StimModelRuleSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimModelType child, StimModelRuleSet values) {
    child.rules += values;
  }

  @override
  void onSet(StimModelType child, StimModelRuleSet values) {
    child.rules = values;
  }
}
    