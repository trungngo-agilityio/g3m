part of g3.stimpack.model;

class StimModelType extends StimSymbol<StimModelType, StimModelTypeSet> {
  StimModelFieldSet fields;
  StimModelRuleSet rules;

  StimModelType._(StimScopeImpl<StimModelType, StimModelTypeSet> scope)
      : super(scope);

  @override
  StimModelType clone() {
    return super.clone()
      ..fields = fields.clone()
      ..rules = rules.clone();    
  }
}

class StimModelTypeSet
    extends StimSymbolSet<StimModelType, StimModelTypeSet> {
  final _StimModelPackImpl _pack;

  StimModelTypeSet._(this._pack, List<StimModelType> items)
      : super(_pack._type, items);

        
        
  _StimModelType_FieldSetOp _fields;

  _StimModelType_FieldSetOp get fields =>
      _fields ??= _StimModelType_FieldSetOp(this, _pack.field);

  set fields(_StimModelType_FieldSetOp value) => _fields = value;
                
        
  _StimModelType_RuleSetOp _rules;

  _StimModelType_RuleSetOp get rules =>
      _rules ??= _StimModelType_RuleSetOp(this, _pack.rule);

  set rules(_StimModelType_RuleSetOp value) => _rules = value;
        
}

abstract class _StimModelTypeScope
    extends StimScope<StimModelType, StimModelTypeSet> {
  StimModelType of(dynamic name, {dynamic fields, dynamic rules});
}

class _StimModelTypeScopeImpl
    extends StimScopeImpl<StimModelType, StimModelTypeSet>
    implements _StimModelTypeScope {
  final _StimModelPackImpl _pack;

  _StimModelTypeScopeImpl._(this._pack) : super();

  @override
  void clear(StimModelType symbol) {
    symbol
      ..fields = _pack.field.noneSet
      ..rules = _pack.rule.noneSet;    
  }

  @override
  StimModelType create() => StimModelType._(this);

  @override
  StimModelType of(dynamic name, {dynamic fields, dynamic rules}) {
    return createAndClear(name)
      ..fields = fields ?? _pack.field.noneSet
      ..rules = rules ?? _pack.rule.noneSet;    
  }

  @override
  StimModelTypeSet createSet(List<StimModelType> items) {
    return StimModelTypeSet._(_pack, items);
  }
}
    