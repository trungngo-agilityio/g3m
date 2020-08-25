part of g3.stimpack.model;

class StimModelField extends StimSymbol<StimModelField, StimModelFieldSet> {
  StimModelType type;
  StimModelRuleSet rules;

  StimModelField._(StimScopeImpl<StimModelField, StimModelFieldSet> scope)
      : super(scope);

  @override
  StimModelField clone() {
    return super.clone()
      ..type = type.clone()
      ..rules = rules.clone();    
  }
}

class StimModelFieldSet
    extends StimSymbolSet<StimModelField, StimModelFieldSet> {
  final _StimModelPackImpl _pack;

  StimModelFieldSet._(this._pack, List<StimModelField> items)
      : super(_pack._field, items);

         
         
  _StimModelField_TypeOp _type;

  _StimModelField_TypeOp get type =>
      _type ??= _StimModelField_TypeOp(this, _pack.type);

  set type(_StimModelField_TypeOp value) => _type = value;
                
        
  _StimModelField_RuleSetOp _rules;

  _StimModelField_RuleSetOp get rules =>
      _rules ??= _StimModelField_RuleSetOp(this, _pack.rule);

  set rules(_StimModelField_RuleSetOp value) => _rules = value;
        
}

abstract class _StimModelFieldScope
    extends StimScope<StimModelField, StimModelFieldSet> {
  StimModelField of(dynamic name, {dynamic type, dynamic rules});
}

class _StimModelFieldScopeImpl
    extends StimScopeImpl<StimModelField, StimModelFieldSet>
    implements _StimModelFieldScope {
  final _StimModelPackImpl _pack;

  _StimModelFieldScopeImpl._(this._pack) : super();

  @override
  void clear(StimModelField symbol) {
    symbol
      ..type = _pack.type.none
      ..rules = _pack.rule.noneSet;    
  }

  @override
  StimModelField create() => StimModelField._(this);

  @override
  StimModelField of(dynamic name, {dynamic type, dynamic rules}) {
    return createAndClear(name)
      ..type = type ?? _pack.type.none
      ..rules = rules ?? _pack.rule.noneSet;    
  }

  @override
  StimModelFieldSet createSet(List<StimModelField> items) {
    return StimModelFieldSet._(_pack, items);
  }
}
    