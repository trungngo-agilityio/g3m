part of g3.stimpack.meta.generated;

class StimMetaPack extends StimSymbol<StimMetaPack, StimMetaPackSet > {
  StimMetaTypeSet types;

  StimMetaPack._(_StimMetaPackScopeImpl scope)
      : super(scope);

  @override
  StimMetaPack clone() {
    return super.clone()
      ..types = types.clone();    
  }
}

class StimMetaPackSet
    extends StimSymbolSet<StimMetaPack, StimMetaPackSet> {
  final _StimMetaMetaImpl __pack;

  
  StimMetaPackSet._(this.__pack, List<StimMetaPack> items)
      : super(__pack._pack, items);

        
        
  StimMetaPackXTypesSetOp _types;

  StimMetaPackXTypesSetOp get type =>
      _types ??= StimMetaPackXTypesSetOp(this, __pack.type);

  set types(StimMetaPackXTypesSetOp value) => _types = value;
        
}

abstract class StimMetaPackScope
    extends StimScope<StimMetaPack, StimMetaPackSet> {
    
  StimMetaPackSymbols get s;
    
  StimMetaPack of(dynamic name, {dynamic types});
}

class StimMetaPackSymbols {
  final _StimMetaPackScopeImpl _scope;
  /// All symbols
  StimMetaPackSet all;

  
  StimMetaPackSymbols(this._scope) {
    final _s = stimpack.meta.pack;
    all = _s.noneSet;

  }
}

class _StimMetaPackScopeImpl 
    extends StimScopeImpl<StimMetaPack, StimMetaPackSet>
    implements StimMetaPackScope {
  final _StimMetaMetaImpl __pack;
  
  _StimMetaPackScopeImpl._(this.__pack) : super();

  StimMetaPackSymbols _s;

  @override
  StimMetaPackSymbols get s => _s ??= StimMetaPackSymbols(this);
  @override
  void clear(StimMetaPack symbol) {
    symbol
      ..types = __pack.type.noneSet;    
  }

  @override
  StimMetaPack create() => StimMetaPack._(this);

  @override
  StimMetaPack of(dynamic name, {dynamic types}) {
    return createAndClear(name)
      ..types += types ?? __pack.type.noneSet;    
  }

  @override
  StimMetaPackSet createSet(List<StimMetaPack> items) {
    return StimMetaPackSet._(__pack, items);
  }
}
    