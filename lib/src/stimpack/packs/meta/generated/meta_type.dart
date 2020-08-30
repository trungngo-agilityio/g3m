part of g3.stimpack.meta.generated;



class StimMetaType extends StimSymbol<StimMetaType, StimMetaTypeSet> {
  StimMetaFieldSet fields;

  StimMetaPresetSet presets;

  StimMetaPack pack;

  StimMetaFieldSet fields;

  StimMetaPresetSet presets;

  StimMetaPack pack;

  StimMetaType(_StimMetaTypeScopeImpl scope):
      super(scope);


  @override
  StimMetaType clone() {
    return super.clone()
        ..fields = fields.clone()
        ..presets = presets.clone()
        ..pack = pack.clone()
        ..fields = fields.clone()
        ..presets = presets.clone()
        ..pack = pack.clone();
  }
}


class StimMetaTypeSet extends StimSymbolSet<StimMetaType, StimMetaTypeSet> {
  final _StimMetaTypeScopeImpl _scope;

  StimMetaTypeXFieldsSetOp _fields;

  StimMetaTypeXPresetsSetOp _presets;

  StimMetaTypeXPackOp _pack;

  StimMetaTypeXFieldsSetOp _fields;

  StimMetaTypeXPresetsSetOp _presets;

  StimMetaTypeXPackOp _pack;

  StimMetaTypeXFieldsSetOp get fields {
    return _fields ??= StimMetaTypeXFieldsSetOp(this, stimpack.meta.field);
  }

  set fields(StimMetaTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimMetaTypeXPresetsSetOp get presets {
    return _presets ??= StimMetaTypeXPresetsSetOp(this, stimpack.meta.preset);
  }

  set presets(StimMetaTypeXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaTypeXPackOp get pack {
    return _pack ??= StimMetaTypeXPackOp(this, stimpack.meta.pack);
  }

  set pack(StimMetaTypeXPackOp value) {
    _pack = value;
  }
  StimMetaTypeXFieldsSetOp get fields {
    return _fields ??= StimMetaTypeXFieldsSetOp(this, stimpack.meta.field);
  }

  set fields(StimMetaTypeXFieldsSetOp value) {
    _fields = value;
  }
  StimMetaTypeXPresetsSetOp get presets {
    return _presets ??= StimMetaTypeXPresetsSetOp(this, stimpack.meta.preset);
  }

  set presets(StimMetaTypeXPresetsSetOp value) {
    _presets = value;
  }
  StimMetaTypeXPackOp get pack {
    return _pack ??= StimMetaTypeXPackOp(this, stimpack.meta.pack);
  }

  set pack(StimMetaTypeXPackOp value) {
    _pack = value;
  }
  StimMetaTypeSet(this._scope, List<StimMetaType> items):
      super(_scope, items);
}


abstract class StimMetaTypeScope extends StimScope<StimMetaType, StimMetaTypeSet> {
  StimMetaType of(name, {dynamic fields, dynamic presets, dynamic pack, dynamic fields, dynamic presets, dynamic pack});
}


class _StimMetaTypeScopeImpl extends StimScopeImpl<StimMetaType, StimMetaTypeSet> implements StimMetaTypeScope {
  StimMetaFieldSet fields;

  StimMetaPresetSet presets;

  StimMetaPack pack;

  StimMetaFieldSet fields;

  StimMetaPresetSet presets;

  StimMetaPack pack;

  _StimMetaTypeScopeImpl():
      super();


  @override
  StimMetaType of(name, {dynamic fields, dynamic presets, dynamic pack, dynamic fields, dynamic presets, dynamic pack}) {
    return createAndClear(name)
        ..fields += fields ?? stimpack.meta.field.noneSet
        ..presets += presets ?? stimpack.meta.preset.noneSet
        ..pack = pack ?? stimpack.meta.pack.none
        ..fields += fields ?? stimpack.meta.field.noneSet
        ..presets += presets ?? stimpack.meta.preset.noneSet
        ..pack = pack ?? stimpack.meta.pack.none;
  }

  @override
  void clear(StimMetaType symbol) {
    symbol
        ..fields = stimpack.meta.field.noneSet
        ..presets = stimpack.meta.preset.noneSet
        ..pack = stimpack.meta.pack.none
        ..fields = stimpack.meta.field.noneSet
        ..presets = stimpack.meta.preset.noneSet
        ..pack = stimpack.meta.pack.none;
  }

  @override
  StimMetaType create() {
    return StimMetaType(this);
  }

  @override
  StimMetaTypeSet createSet(List<StimMetaType> items) {
    return StimMetaTypeSet(this, items);
  }
}
