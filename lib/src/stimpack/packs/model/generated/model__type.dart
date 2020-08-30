part of g3.stimpack.model.generated;



class StimModelType extends StimSymbol<StimModelType, StimModelTypeSet> {
  StimModelFieldSet fields;

  StimModelRuleSet rules;

  StimModelType(_StimModelTypeScopeImpl scope):
      super(scope);


  @override
  StimModelType clone() {
    return super.clone()
        ..fields = fields.clone()
        ..rules = rules.clone();
  }
}


class StimModelTypeSet extends StimSymbolSet<StimModelType, StimModelTypeSet> {
  final _StimModelTypeScopeImpl _scope;

  StimModelTypeXFieldsSetOp _fields;

  StimModelTypeXRulesSetOp _rules;

  StimModelTypeXFieldsSetOp get fields {
    return _fields ??= StimModelTypeXFieldsSetOp(this, stimpack.model.field);
  }

  set fields(StimModelTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimModelTypeXRulesSetOp get rules {
    return _rules ??= StimModelTypeXRulesSetOp(this, stimpack.model.rule);
  }

  set rules(StimModelTypeXRulesSetOp value) {
    _rules = value;
  }
  StimModelTypeSet(this._scope, List<StimModelType> items):
      super(_scope, items);
}


abstract class StimModelTypeScope extends StimScope<StimModelType, StimModelTypeSet> {
  StimModelType of(name, {dynamic fields, dynamic rules});
}


class _StimModelTypeScopeImpl extends StimScopeImpl<StimModelType, StimModelTypeSet> implements StimModelTypeScope {
  StimModelFieldSet fields;

  StimModelRuleSet rules;

  _StimModelTypeScopeImpl():
      super();


  @override
  StimModelType of(name, {dynamic fields, dynamic rules}) {
    return createAndClear(name)
        ..fields += fields ?? stimpack.model.field.noneSet
        ..rules += rules ?? stimpack.model.rule.noneSet;
  }

  @override
  void clear(StimModelType symbol) {
    symbol
        ..fields = stimpack.model.field.noneSet
        ..rules = stimpack.model.rule.noneSet;
  }

  @override
  StimModelType create() {
    return StimModelType(this);
  }

  @override
  StimModelTypeSet createSet(List<StimModelType> items) {
    return StimModelTypeSet(this, items);
  }
}
