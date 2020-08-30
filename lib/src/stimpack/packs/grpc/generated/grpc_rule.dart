part of g3.stimpack.grpc.generated;



class StimModelRule extends StimSymbol<StimModelRule, StimModelRuleSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimModelRule(_StimModelRuleScopeImpl scope):
      super(scope);


  @override
  StimModelRule clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimModelRuleSet extends StimSymbolSet<StimModelRule, StimModelRuleSet> {
  final _StimModelRuleScopeImpl _scope;

  StimModelRuleXRangeSetOp _range;

  StimModelRuleXPatternsSetOp _patterns;

  StimModelRuleXRangeSetOp get range {
    return _range ??= StimModelRuleXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimModelRuleXRangeSetOp value) {
    _range = value;
  }
  StimModelRuleXPatternsSetOp get patterns {
    return _patterns ??= StimModelRuleXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimModelRuleXPatternsSetOp value) {
    _patterns = value;
  }
  StimModelRuleSet(this._scope, List<StimModelRule> items):
      super(_scope, items);
}


abstract class StimModelRuleScope extends StimScope<StimModelRule, StimModelRuleSet> {
  StimModelRule of(name, {dynamic range, dynamic patterns});
}


class _StimModelRuleScopeImpl extends StimScopeImpl<StimModelRule, StimModelRuleSet> implements StimModelRuleScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  _StimModelRuleScopeImpl():
      super();


  @override
  StimModelRule of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimModelRule symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet;
  }

  @override
  StimModelRule create() {
    return StimModelRule(this);
  }

  @override
  StimModelRuleSet createSet(List<StimModelRule> items) {
    return StimModelRuleSet(this, items);
  }
}
