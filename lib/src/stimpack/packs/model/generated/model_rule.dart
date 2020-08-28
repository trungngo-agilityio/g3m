part of g3.stimpack.model.generated;

class StimModelRule extends StimSymbol<StimModelRule, StimModelRuleSet > {


  StimModelRule._(_StimModelRuleScopeImpl scope)
      : super(scope);

  @override
  StimModelRule clone() {
    return super.clone()
;    
  }
}

class StimModelRuleSet
    extends StimSymbolSet<StimModelRule, StimModelRuleSet> {
  final _StimModelModelImpl __pack;

  
  StimModelRuleSet._(this.__pack, List<StimModelRule> items)
      : super(__pack._rule, items);


}

abstract class StimModelRuleScope
    extends StimScope<StimModelRule, StimModelRuleSet> {
    
  StimModelRuleSymbols get s;
    
  StimModelRule of(dynamic name);
}

class StimModelRuleSymbols {
  final _StimModelRuleScopeImpl _scope;
  /// All symbols
  StimModelRuleSet all;

  
  StimModelRuleSymbols(this._scope) {
    final _s = stimpack.model.rule;
    all = _s.noneSet;

  }
}

class _StimModelRuleScopeImpl 
    extends StimScopeImpl<StimModelRule, StimModelRuleSet>
    implements StimModelRuleScope {
  final _StimModelModelImpl __pack;
  
  _StimModelRuleScopeImpl._(this.__pack) : super();

  StimModelRuleSymbols _s;

  @override
  StimModelRuleSymbols get s => _s ??= StimModelRuleSymbols(this);
  @override
  void clear(StimModelRule symbol) {
    
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
    return StimModelRuleSet._(__pack, items);
  }
}
    