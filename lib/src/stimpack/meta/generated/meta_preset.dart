part of g3.stimpack.meta.generated;

class StimMetaPreset extends StimSymbol<StimMetaPreset, StimMetaPresetSet > {
  StimMetaValueSet values;

  StimMetaPreset._(_StimMetaPresetScopeImpl scope)
      : super(scope);

  @override
  StimMetaPreset clone() {
    return super.clone()
      ..values = values.clone();    
  }
}

class StimMetaPresetSet
    extends StimSymbolSet<StimMetaPreset, StimMetaPresetSet> {
  final _StimMetaMetaImpl __pack;

  
  StimMetaPresetSet._(this.__pack, List<StimMetaPreset> items)
      : super(__pack._preset, items);

        
        
  StimMetaPresetXValuesSetOp _values;

  StimMetaPresetXValuesSetOp get value =>
      _values ??= StimMetaPresetXValuesSetOp(this, __pack.value);

  set values(StimMetaPresetXValuesSetOp value) => _values = value;
        
}

abstract class StimMetaPresetScope
    extends StimScope<StimMetaPreset, StimMetaPresetSet> {
    
  StimMetaPresetSymbols get s;
    
  StimMetaPreset of(dynamic name, {dynamic values});
}

class StimMetaPresetSymbols {
  final _StimMetaPresetScopeImpl _scope;
  /// All symbols
  StimMetaPresetSet all;

  
  StimMetaPresetSymbols(this._scope) {
    final _s = stimpack.meta.preset;
    all = _s.noneSet;

  }
}

class _StimMetaPresetScopeImpl 
    extends StimScopeImpl<StimMetaPreset, StimMetaPresetSet>
    implements StimMetaPresetScope {
  final _StimMetaMetaImpl __pack;
  
  _StimMetaPresetScopeImpl._(this.__pack) : super();

  StimMetaPresetSymbols _s;

  @override
  StimMetaPresetSymbols get s => _s ??= StimMetaPresetSymbols(this);
  @override
  void clear(StimMetaPreset symbol) {
    symbol
      ..values = __pack.value.noneSet;    
  }

  @override
  StimMetaPreset create() => StimMetaPreset._(this);

  @override
  StimMetaPreset of(dynamic name, {dynamic values}) {
    return createAndClear(name)
      ..values += values ?? __pack.value.noneSet;    
  }

  @override
  StimMetaPresetSet createSet(List<StimMetaPreset> items) {
    return StimMetaPresetSet._(__pack, items);
  }
}
    