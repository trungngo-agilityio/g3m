part of g3.stimpack.model.generated;

class StimModelField extends StimSymbol<StimModelField, StimModelFieldSet > {
  StimModelType type;
  StimModelRuleSet rules;

  StimModelField._(_StimModelFieldScopeImpl scope)
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
  final _StimModelModelImpl __pack;

  
  StimModelFieldSet._(this.__pack, List<StimModelField> items)
      : super(__pack._field, items);

         
         
  StimModelFieldXTypeSetOp _type;

  StimModelFieldXTypeSetOp get type =>
      _type ??= StimModelFieldXTypeSetOp(this, __pack.type);

  set type(StimModelFieldXTypeSetOp value) => _type = value;
                
        
  StimModelFieldXRulesSetOp _rules;

  StimModelFieldXRulesSetOp get rule =>
      _rules ??= StimModelFieldXRulesSetOp(this, __pack.rule);

  set rules(StimModelFieldXRulesSetOp value) => _rules = value;
        
}

abstract class StimModelFieldScope
    extends StimScope<StimModelField, StimModelFieldSet> {
    
  StimModelFieldSymbols get s;
    
  StimModelField of(dynamic name, {dynamic type, dynamic rules});
}

class StimModelFieldSymbols {
  final _StimModelFieldScopeImpl _scope;
  /// All symbols
  StimModelFieldSet all;

  
  StimModelFieldSymbols(this._scope) {
    final _s = stimpack.model.field;
    all = _s.noneSet;

  }
}

class _StimModelFieldScopeImpl 
    extends StimScopeImpl<StimModelField, StimModelFieldSet>
    implements StimModelFieldScope {
  final _StimModelModelImpl __pack;
  
  _StimModelFieldScopeImpl._(this.__pack) : super();

  StimModelFieldSymbols _s;

  @override
  StimModelFieldSymbols get s => _s ??= StimModelFieldSymbols(this);
  @override
  void clear(StimModelField symbol) {
    symbol
      ..type = __pack.type.none
      ..rules = __pack.rule.noneSet;    
  }

  @override
  StimModelField create() => StimModelField._(this);

  @override
  StimModelField of(dynamic name, {dynamic type, dynamic rules}) {
    return createAndClear(name)
      ..type = type ?? __pack.type.none
      ..rules += rules ?? __pack.rule.noneSet;    
  }

  @override
  StimModelFieldSet createSet(List<StimModelField> items) {
    return StimModelFieldSet._(__pack, items);
  }
}
    