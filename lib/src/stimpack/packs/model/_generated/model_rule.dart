part of g3.stimpack.model.generated;

class StimModelRule extends StimSymbol<StimModelRule, StimModelRuleSet> {


  StimModelRule._(StimScopeImpl<StimModelRule, StimModelRuleSet> scope)
      : super(scope);

  @override
  StimModelRule clone() {
    return super.clone()
;    
  }
}

class StimModelRuleSet
    extends StimSymbolSet<StimModelRule, StimModelRuleSet> {
  final _StimModelPackImpl _pack;

  StimModelRuleSet._(this._pack, List<StimModelRule> items)
      : super(_pack._rule, items);


}

abstract class _StimModelRuleScope
    extends StimScope<StimModelRule, StimModelRuleSet> {
  StimModelRule of(dynamic name);
}

class _StimModelRuleScopeImpl
    extends StimScopeImpl<StimModelRule, StimModelRuleSet>
    implements _StimModelRuleScope {
  final _StimModelPackImpl _pack;

  _StimModelRuleScopeImpl._(this._pack) : super();

  @override
  void clear(StimModelRule symbol) {
    symbol
;    
  }

  @override
  StimModelRule create() => StimModelRule._(this);

  @override
  StimModelRule of(dynamic name) {
    return createAndClear(name)
;    
  }

  @override
  StimModelRuleSet createSet(List<StimModelRule> items) {
    return StimModelRuleSet._(_pack, items);
  }
}
    