part of g3.stimpack.model.generated;



class StimModelField extends StimSymbol<StimModelField, StimModelFieldSet> {
  StimModelType type;

  StimModelRuleSet rules;

  StimModelField(_StimModelFieldScopeImpl scope):
      super(scope);


  @override
  StimModelField clone() {
    return super.clone()
        ..type = type.clone()
        ..rules = rules.clone();
  }
}


class StimModelFieldSet extends StimSymbolSet<StimModelField, StimModelFieldSet> {
  final _StimModelFieldScopeImpl _scope;

  StimModelFieldXTypeOp _type;

  StimModelFieldXRulesSetOp _rules;

  StimModelFieldXTypeOp get type {
    return _type ??= StimModelFieldXTypeOp(this, stimpack.model.type);
  }

  set type(StimModelFieldXTypeOp value) {
    _type = value;
  }
  StimModelFieldXRulesSetOp get rules {
    return _rules ??= StimModelFieldXRulesSetOp(this, stimpack.model.rule);
  }

  set rules(StimModelFieldXRulesSetOp value) {
    _rules = value;
  }
  StimModelFieldSet(this._scope, List<StimModelField> items):
      super(_scope, items);
}


abstract class StimModelFieldScope extends StimScope<StimModelField, StimModelFieldSet> {
  StimModelField of(name, {dynamic type, dynamic rules});
}


class _StimModelFieldScopeImpl extends StimScopeImpl<StimModelField, StimModelFieldSet> implements StimModelFieldScope {
  StimModelType type;

  StimModelRuleSet rules;

  _StimModelFieldScopeImpl():
      super();


  @override
  StimModelField of(name, {dynamic type, dynamic rules}) {
    return createAndClear(name)
        ..type = type ?? stimpack.model.type.none
        ..rules += rules ?? stimpack.model.rule.noneSet;
  }

  @override
  void clear(StimModelField symbol) {
    symbol
        ..type = stimpack.model.type.none
        ..rules = stimpack.model.rule.noneSet;
  }

  @override
  StimModelField create() {
    return StimModelField(this);
  }

  @override
  StimModelFieldSet createSet(List<StimModelField> items) {
    return StimModelFieldSet(this, items);
  }
}
