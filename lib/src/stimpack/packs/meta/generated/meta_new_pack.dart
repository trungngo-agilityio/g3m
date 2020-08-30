part of g3.stimpack.meta_new.generated;



class StimMetaNewPack extends StimSymbol<StimMetaNewPack, StimMetaNewPackSet> {
  StimMetaNewTypeSet types;

  StimMetaPresetSet presets;

  StimMetaNewTypeSet types;

  StimMetaNewPresetSet presets;

  StimMetaNewPack(_StimMetaNewPackScopeImpl scope):
      super(scope);


  @override
  StimMetaNewPack clone() {
    return super.clone()
        ..types = types.clone()
        ..presets = presets.clone()
        ..types = types.clone()
        ..presets = presets.clone();
  }
}


class StimMetaNewPackSet extends StimSymbolSet<StimMetaNewPack, StimMetaNewPackSet> {
  final _StimMetaNewPackScopeImpl _scope;

  StimMetaNewPackXTypesSetOp _types;

  StimMetaNewPackXPresetsSetOp _presets;

  StimMetaNewPackXTypesSetOp _types;

  StimMetaNewPackXPresetsSetOp _presets;

  StimMetaNewPackXTypesSetOp get types {
    return _types ??= StimMetaNewPackXTypesSetOp(this, stimpack.metaNew.type);
  }

  set types(StimMetaNewPackXTypesSetOp value) {
    _types = value;
  }
  StimMetaNewPackXPresetsSetOp get presets {
    return _presets ??= StimMetaNewPackXPresetsSetOp(this, stimpack.meta.preset);
  }

  set presets(StimMetaNewPackXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaNewPackXTypesSetOp get types {
    return _types ??= StimMetaNewPackXTypesSetOp(this, stimpack.metaNew.type);
  }

  set types(StimMetaNewPackXTypesSetOp value) {
    _types = value;
  }
  StimMetaNewPackXPresetsSetOp get presets {
    return _presets ??= StimMetaNewPackXPresetsSetOp(this, stimpack.metaNew.preset);
  }

  set presets(StimMetaNewPackXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaNewPackSet(this._scope, List<StimMetaNewPack> items):
      super(_scope, items);
}


abstract class StimMetaNewPackScope extends StimScope<StimMetaNewPack, StimMetaNewPackSet> {
  StimMetaNewPack of(name, {dynamic types, dynamic presets, dynamic types, dynamic presets});
}


class _StimMetaNewPackScopeImpl extends StimScopeImpl<StimMetaNewPack, StimMetaNewPackSet> implements StimMetaNewPackScope {
  StimMetaNewTypeSet types;

  StimMetaPresetSet presets;

  StimMetaNewTypeSet types;

  StimMetaNewPresetSet presets;

  _StimMetaNewPackScopeImpl():
      super();


  @override
  StimMetaNewPack of(name, {dynamic types, dynamic presets, dynamic types, dynamic presets}) {
    return createAndClear(name)
        ..types += types ?? stimpack.metaNew.type.noneSet
        ..presets += presets ?? stimpack.meta.preset.noneSet
        ..types += types ?? stimpack.metaNew.type.noneSet
        ..presets += presets ?? stimpack.metaNew.preset.noneSet;
  }

  @override
  void clear(StimMetaNewPack symbol) {
    symbol
        ..types = stimpack.metaNew.type.noneSet
        ..presets = stimpack.meta.preset.noneSet
        ..types = stimpack.metaNew.type.noneSet
        ..presets = stimpack.metaNew.preset.noneSet;
  }

  @override
  StimMetaNewPack create() {
    return StimMetaNewPack(this);
  }

  @override
  StimMetaNewPackSet createSet(List<StimMetaNewPack> items) {
    return StimMetaNewPackSet(this, items);
  }
}
