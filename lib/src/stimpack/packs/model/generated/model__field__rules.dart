part of g3.stimpack.model.generated;



class StimModelFieldXRulesSetOp extends StimSymbolSetOpImpl<StimModelField, StimModelFieldSet, StimModelRule, StimModelRuleSet> {
  StimModelFieldXRulesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRuleScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelField child, StimModelRuleSet values) {
    child.rules = values;
  }

  @override
  void onAdd(StimModelField child, StimModelRuleSet values) {
    child.rules += values;
  }
}
