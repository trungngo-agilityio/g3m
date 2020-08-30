part of g3.stimpack.meta_new.generated;



class StimMetaNewType extends StimSymbol<StimMetaNewType, StimMetaNewTypeSet> {
  StimMetaNewFieldSet fields;

  StimMetaPresetSet presets;

  StimMetaNewPack pack;

  StimMetaNewFieldSet fields;

  StimMetaNewPresetSet presets;

  StimMetaNewPack pack;

  StimMetaNewType(_StimMetaNewTypeScopeImpl scope):
      super(scope);


  @override
  StimMetaNewType clone() {
    return super.clone()
        ..fields = fields.clone()
        ..presets = presets.clone()
        ..pack = pack.clone()
        ..fields = fields.clone()
        ..presets = presets.clone()
        ..pack = pack.clone();
  }
}


class StimMetaNewTypeSet extends StimSymbolSet<StimMetaNewType, StimMetaNewTypeSet> {
  final _StimMetaNewTypeScopeImpl _scope;

  StimMetaNewTypeXFieldsSetOp _fields;

  StimMetaNewTypeXPresetsSetOp _presets;

  StimMetaNewTypeXPackOp _pack;

  StimMetaNewTypeXFieldsSetOp _fields;

  StimMetaNewTypeXPresetsSetOp _presets;

  StimMetaNewTypeXPackOp _pack;

  StimMetaNewTypeXFieldsSetOp get fields {
    return _fields ??= StimMetaNewTypeXFieldsSetOp(this, stimpack.metaNew.field);
  }

  set fields(StimMetaNewTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimMetaNewTypeXPresetsSetOp get presets {
    return _presets ??= StimMetaNewTypeXPresetsSetOp(this, stimpack.meta.preset);
  }

  set presets(StimMetaNewTypeXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaNewTypeXPackOp get pack {
    return _pack ??= StimMetaNewTypeXPackOp(this, stimpack.metaNew.pack);
  }

  set pack(StimMetaNewTypeXPackOp value) {
    _pack = value;
  }
  StimMetaNewTypeXFieldsSetOp get fields {
    return _fields ??= StimMetaNewTypeXFieldsSetOp(this, stimpack.metaNew.field);
  }

  set fields(StimMetaNewTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimMetaNewTypeXPresetsSetOp get presets {
    return _presets ??= StimMetaNewTypeXPresetsSetOp(this, stimpack.metaNew.preset);
  }

  set presets(StimMetaNewTypeXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaNewTypeXPackOp get pack {
    return _pack ??= StimMetaNewTypeXPackOp(this, stimpack.metaNew.pack);
  }

  set pack(StimMetaNewTypeXPackOp value) {
    _pack = value;
  }
  StimMetaNewTypeSet(this._scope, List<StimMetaNewType> items):
      super(_scope, items);
}


abstract class StimMetaNewTypeScope extends StimScope<StimMetaNewType, StimMetaNewTypeSet> {
  StimMetaNewType of(name, {dynamic fields, dynamic presets, dynamic pack, dynamic fields, dynamic presets, dynamic pack});
}


class _StimMetaNewTypeScopeImpl extends StimScopeImpl<StimMetaNewType, StimMetaNewTypeSet> implements StimMetaNewTypeScope {
  StimMetaNewFieldSet fields;

  StimMetaPresetSet presets;

  StimMetaNewPack pack;

  StimMetaNewFieldSet fields;

  StimMetaNewPresetSet presets;

  StimMetaNewPack pack;

  _StimMetaNewTypeScopeImpl():
      super();


  @override
  StimMetaNewType of(name, {dynamic fields, dynamic presets, dynamic pack, dynamic fields, dynamic presets, dynamic pack}) {
    return createAndClear(name)
        ..fields += fields ?? stimpack.metaNew.field.noneSet
        ..presets += presets ?? stimpack.meta.preset.noneSet
        ..pack = pack ?? stimpack.metaNew.pack.none
        ..fields += fields ?? stimpack.metaNew.field.noneSet
        ..presets += presets ?? stimpack.metaNew.preset.noneSet
        ..pack = pack ?? stimpack.metaNew.pack.none;
  }

  @override
  void clear(StimMetaNewType symbol) {
    symbol
        ..fields = stimpack.metaNew.field.noneSet
        ..presets = stimpack.meta.preset.noneSet
        ..pack = stimpack.metaNew.pack.none
        ..fields = stimpack.metaNew.field.noneSet
        ..presets = stimpack.metaNew.preset.noneSet
        ..pack = stimpack.metaNew.pack.none;
  }

  @override
  StimMetaNewType create() {
    return StimMetaNewType(this);
  }

  @override
  StimMetaNewTypeSet createSet(List<StimMetaNewType> items) {
    return StimMetaNewTypeSet(this, items);
  }
}
