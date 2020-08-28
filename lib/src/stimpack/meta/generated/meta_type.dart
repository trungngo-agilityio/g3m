part of g3.stimpack.meta.generated;

class StimMetaType extends StimSymbol<StimMetaType, StimMetaTypeSet > {
  StimMetaFieldSet fields;
  StimMetaPresetSet presets;
  StimMetaPack pack;

  StimMetaType._(_StimMetaTypeScopeImpl scope)
      : super(scope);

  @override
  StimMetaType clone() {
    return super.clone()
      ..fields = fields.clone()
      ..presets = presets.clone()
      ..pack = pack.clone();    
  }
}

class StimMetaTypeSet
    extends StimSymbolSet<StimMetaType, StimMetaTypeSet> {
  final _StimMetaMetaImpl __pack;

  
  StimMetaTypeSet._(this.__pack, List<StimMetaType> items)
      : super(__pack._type, items);

        
        
  StimMetaTypeXFieldsSetOp _fields;

  StimMetaTypeXFieldsSetOp get field =>
      _fields ??= StimMetaTypeXFieldsSetOp(this, __pack.field);

  set fields(StimMetaTypeXFieldsSetOp value) => _fields = value;
                
        
  StimMetaTypeXPresetsSetOp _presets;

  StimMetaTypeXPresetsSetOp get preset =>
      _presets ??= StimMetaTypeXPresetsSetOp(this, __pack.preset);

  set presets(StimMetaTypeXPresetsSetOp value) => _presets = value;
                 
         
  StimMetaTypeXPackSetOp _pack;

  StimMetaTypeXPackSetOp get pack =>
      _pack ??= StimMetaTypeXPackSetOp(this, __pack.pack);

  set pack(StimMetaTypeXPackSetOp value) => _pack = value;
        
}

abstract class StimMetaTypeScope
    extends StimScope<StimMetaType, StimMetaTypeSet> {
    
  StimMetaTypeSymbols get s;
    
  StimMetaType of(dynamic name, {dynamic fields, dynamic presets, dynamic pack});
}

class StimMetaTypeSymbols {
  final _StimMetaTypeScopeImpl _scope;
  /// All symbols
  StimMetaTypeSet all;

  
  StimMetaTypeSymbols(this._scope) {
    final _s = stimpack.meta.type;
    all = _s.noneSet;

  }
}

class _StimMetaTypeScopeImpl 
    extends StimScopeImpl<StimMetaType, StimMetaTypeSet>
    implements StimMetaTypeScope {
  final _StimMetaMetaImpl __pack;
  
  _StimMetaTypeScopeImpl._(this.__pack) : super();

  StimMetaTypeSymbols _s;

  @override
  StimMetaTypeSymbols get s => _s ??= StimMetaTypeSymbols(this);
  @override
  void clear(StimMetaType symbol) {
    symbol
      ..fields = __pack.field.noneSet
      ..presets = __pack.preset.noneSet
      ..pack = __pack.pack.none;    
  }

  @override
  StimMetaType create() => StimMetaType._(this);

  @override
  StimMetaType of(dynamic name, {dynamic fields, dynamic presets, dynamic pack}) {
    return createAndClear(name)
      ..fields += fields ?? __pack.field.noneSet
      ..presets += presets ?? __pack.preset.noneSet
      ..pack = pack ?? __pack.pack.none;    
  }

  @override
  StimMetaTypeSet createSet(List<StimMetaType> items) {
    return StimMetaTypeSet._(__pack, items);
  }
}
    