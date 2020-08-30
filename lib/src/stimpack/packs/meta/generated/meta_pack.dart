part of g3.stimpack.meta.generated;



class StimMetaPack extends StimSymbol<StimMetaPack, StimMetaPackSet> {
  StimMetaTypeSet types;

  StimMetaPresetSet presets;

  StimMetaTypeSet types;

  StimMetaPresetSet presets;

  StimMetaPack(_StimMetaPackScopeImpl scope):
      super(scope);


  @override
  StimMetaPack clone() {
    return super.clone()
        ..types = types.clone()
        ..presets = presets.clone()
        ..types = types.clone()
        ..presets = presets.clone();
  }
}


class StimMetaPackSet extends StimSymbolSet<StimMetaPack, StimMetaPackSet> {
  final _StimMetaPackScopeImpl _scope;

  StimMetaPackXTypesSetOp _types;

  StimMetaPackXPresetsSetOp _presets;

  StimMetaPackXTypesSetOp _types;

  StimMetaPackXPresetsSetOp _presets;

  StimMetaPackXTypesSetOp get types {
    return _types ??= StimMetaPackXTypesSetOp(this, stimpack.meta.type);
  }

  set types(StimMetaPackXTypesSetOp value) {
    _types = value;
  }
  StimMetaPackXPresetsSetOp get presets {
    return _presets ??= StimMetaPackXPresetsSetOp(this, stimpack.meta.preset);
  }

  set presets(StimMetaPackXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaPackXTypesSetOp get types {
    return _types ??= StimMetaPackXTypesSetOp(this, stimpack.meta.type);
  }

  set types(StimMetaPackXTypesSetOp value) {
    _types = value;
  }
  StimMetaPackXPresetsSetOp get presets {
    return _presets ??= StimMetaPackXPresetsSetOp(this, stimpack.meta.preset);
  }

  set presets(StimMetaPackXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaPackSet(this._scope, List<StimMetaPack> items):
      super(_scope, items);
}


abstract class StimMetaPackScope extends StimScope<StimMetaPack, StimMetaPackSet> {
  StimMetaPack of(name, {dynamic types, dynamic presets, dynamic types, dynamic presets});
}


class _StimMetaPackScopeImpl extends StimScopeImpl<StimMetaPack, StimMetaPackSet> implements StimMetaPackScope {
  StimMetaTypeSet types;

  StimMetaPresetSet presets;

  StimMetaTypeSet types;

  StimMetaPresetSet presets;

  _StimMetaPackScopeImpl():
      super();


  @override
  StimMetaPack of(name, {dynamic types, dynamic presets, dynamic types, dynamic presets}) {
    return createAndClear(name)
        ..types += types ?? stimpack.meta.type.noneSet
        ..presets += presets ?? stimpack.meta.preset.noneSet
        ..types += types ?? stimpack.meta.type.noneSet
        ..presets += presets ?? stimpack.meta.preset.noneSet;
  }

  @override
  void clear(StimMetaPack symbol) {
    symbol
        ..types = stimpack.meta.type.noneSet
        ..presets = stimpack.meta.preset.noneSet
        ..types = stimpack.meta.type.noneSet
        ..presets = stimpack.meta.preset.noneSet;
  }

  @override
  StimMetaPack create() {
    return StimMetaPack(this);
  }

  @override
  StimMetaPackSet createSet(List<StimMetaPack> items) {
    return StimMetaPackSet(this, items);
  }
}
