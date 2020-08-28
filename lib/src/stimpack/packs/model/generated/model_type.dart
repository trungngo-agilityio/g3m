part of g3.stimpack.model.generated;

class StimModelType extends StimSymbol<StimModelType, StimModelTypeSet > {
  StimModelFieldSet fields;
  StimModelRuleSet rules;

  StimModelType._(_StimModelTypeScopeImpl scope)
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
  final _StimModelModelImpl __pack;

  
  StimModelTypeSet._(this.__pack, List<StimModelType> items)
      : super(__pack._type, items);

        
        
  StimModelTypeXFieldsSetOp _fields;

  StimModelTypeXFieldsSetOp get field =>
      _fields ??= StimModelTypeXFieldsSetOp(this, __pack.field);

  set fields(StimModelTypeXFieldsSetOp value) => _fields = value;
                
        
  StimModelTypeXRulesSetOp _rules;

  StimModelTypeXRulesSetOp get rule =>
      _rules ??= StimModelTypeXRulesSetOp(this, __pack.rule);

  set rules(StimModelTypeXRulesSetOp value) => _rules = value;
        
}

abstract class StimModelTypeScope
    extends StimScope<StimModelType, StimModelTypeSet> {
    
  StimModelTypeSymbols get s;
    
  StimModelType of(dynamic name, {dynamic fields, dynamic rules});
}

class StimModelTypeSymbols {
  final _StimModelTypeScopeImpl _scope;
  /// All symbols
  StimModelTypeSet all;

  
  StimModelTypeSymbols(this._scope) {
    final _s = stimpack.model.type;
    all = _s.noneSet;

  }
}

class _StimModelTypeScopeImpl 
    extends StimScopeImpl<StimModelType, StimModelTypeSet>
    implements StimModelTypeScope {
  final _StimModelModelImpl __pack;
  
  _StimModelTypeScopeImpl._(this.__pack) : super();

  StimModelTypeSymbols _s;

  @override
  StimModelTypeSymbols get s => _s ??= StimModelTypeSymbols(this);
  @override
  void clear(StimModelType symbol) {
    symbol
      ..fields = __pack.field.noneSet
      ..rules = __pack.rule.noneSet;    
  }

  @override
  StimModelType create() => StimModelType._(this);

  @override
  StimModelType of(dynamic name, {dynamic fields, dynamic rules}) {
    return createAndClear(name)
      ..fields += fields ?? __pack.field.noneSet
      ..rules += rules ?? __pack.rule.noneSet;    
  }

  @override
  StimModelTypeSet createSet(List<StimModelType> items) {
    return StimModelTypeSet._(__pack, items);
  }
}
    