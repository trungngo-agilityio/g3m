part of g3.stimpack.model.generated;

class _StimModelField_RuleSetOp extends StimSymbolSetOpImpl<StimModelField,
    StimModelFieldSet, StimModelRule, StimModelRuleSet> {
  _StimModelField_RuleSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelRule, StimModelRuleSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimModelField child, StimModelRuleSet values) {
    child.rules += values;
  }

  @override
  void onSet(StimModelField child, StimModelRuleSet values) {
    child.rules = values;
  }
}
    