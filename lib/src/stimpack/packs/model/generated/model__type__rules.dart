part of g3.stimpack.model.generated;

class StimModelTypeXRulesSetOp extends StimSymbolSetOpImpl<StimModelType,
    StimModelTypeSet, StimModelRule, StimModelRuleSet> {
  StimModelTypeXRulesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelRuleScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimModelType child, StimModelRuleSet values) {
    child.rules = values;
  }

  @override
  void onAdd(StimModelType child, StimModelRuleSet values) {
    child.rules += values;
  }
}
