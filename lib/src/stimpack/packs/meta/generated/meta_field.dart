part of g3.stimpack.meta.generated;

class StimMetaField extends StimSymbol<StimMetaField, StimMetaFieldSet > {
  StimMetaKind kind;
  StimMetaType type;

  StimMetaField._(_StimMetaFieldScopeImpl scope)
      : super(scope);

  @override
  StimMetaField clone() {
    return super.clone()
      ..kind = kind.clone()
      ..type = type.clone();    
  }
}

class StimMetaFieldSet
    extends StimSymbolSet<StimMetaField, StimMetaFieldSet> {
  final _StimMetaMetaImpl __pack;

  
  StimMetaFieldSet._(this.__pack, List<StimMetaField> items)
      : super(__pack._field, items);

         
         
  StimMetaFieldXKindSetOp _kind;

  StimMetaFieldXKindSetOp get kind =>
      _kind ??= StimMetaFieldXKindSetOp(this, __pack.kind);

  set kind(StimMetaFieldXKindSetOp value) => _kind = value;
                 
         
  StimMetaFieldXTypeSetOp _type;

  StimMetaFieldXTypeSetOp get type =>
      _type ??= StimMetaFieldXTypeSetOp(this, __pack.type);

  set type(StimMetaFieldXTypeSetOp value) => _type = value;
        
}

abstract class StimMetaFieldScope
    extends StimScope<StimMetaField, StimMetaFieldSet> {
    
  StimMetaFieldSymbols get s;
    
  StimMetaField of(dynamic name, {dynamic kind, dynamic type});
}

class StimMetaFieldSymbols {
  final _StimMetaFieldScopeImpl _scope;
  /// All symbols
  StimMetaFieldSet all;

  
  StimMetaFieldSymbols(this._scope) {
    final _s = stimpack.meta.field;
    all = _s.noneSet;

  }
}

class _StimMetaFieldScopeImpl 
    extends StimScopeImpl<StimMetaField, StimMetaFieldSet>
    implements StimMetaFieldScope {
  final _StimMetaMetaImpl __pack;
  
  _StimMetaFieldScopeImpl._(this.__pack) : super();

  StimMetaFieldSymbols _s;

  @override
  StimMetaFieldSymbols get s => _s ??= StimMetaFieldSymbols(this);
  @override
  void clear(StimMetaField symbol) {
    symbol
      ..kind = __pack.kind.none
      ..type = __pack.type.none;    
  }

  @override
  StimMetaField create() => StimMetaField._(this);

  @override
  StimMetaField of(dynamic name, {dynamic kind, dynamic type}) {
    return createAndClear(name)
      ..kind = kind ?? __pack.kind.none
      ..type = type ?? __pack.type.none;    
  }

  @override
  StimMetaFieldSet createSet(List<StimMetaField> items) {
    return StimMetaFieldSet._(__pack, items);
  }
}
    