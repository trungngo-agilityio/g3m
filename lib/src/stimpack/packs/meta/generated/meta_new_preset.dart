part of g3.stimpack.meta_new.generated;



class StimMetaNewPreset extends StimSymbol<StimMetaNewPreset, StimMetaNewPresetSet> {
  StimMetaNewValueSet values;

  StimMetaNewType type;

  StimMetaNewPreset(_StimMetaNewPresetScopeImpl scope):
      super(scope);


  @override
  StimMetaNewPreset clone() {
    return super.clone()
        ..values = values.clone()
        ..type = type.clone();
  }
}


class StimMetaNewPresetSet extends StimSymbolSet<StimMetaNewPreset, StimMetaNewPresetSet> {
  final _StimMetaNewPresetScopeImpl _scope;

  StimMetaNewPresetXValuesSetOp _values;

  StimMetaNewPresetXTypeOp _type;

  StimMetaNewPresetXValuesSetOp get values {
    return _values ??= StimMetaNewPresetXValuesSetOp(this, stimpack.metaNew.value);
  }

  set values(StimMetaNewPresetXValuesSetOp value) {
    _values = value;
  }
  StimMetaNewPresetXTypeOp get type {
    return _type ??= StimMetaNewPresetXTypeOp(this, stimpack.metaNew.type);
  }

  set type(StimMetaNewPresetXTypeOp value) {
    _type = value;
  }
  StimMetaNewPresetSet(this._scope, List<StimMetaNewPreset> items):
      super(_scope, items);
}


abstract class StimMetaNewPresetScope extends StimScope<StimMetaNewPreset, StimMetaNewPresetSet> {
  StimMetaNewPreset of(name, {dynamic values, dynamic type});
}


class _StimMetaNewPresetScopeImpl extends StimScopeImpl<StimMetaNewPreset, StimMetaNewPresetSet> implements StimMetaNewPresetScope {
  StimMetaNewValueSet values;

  StimMetaNewType type;

  _StimMetaNewPresetScopeImpl():
      super();


  @override
  StimMetaNewPreset of(name, {dynamic values, dynamic type}) {
    return createAndClear(name)
        ..values += values ?? stimpack.metaNew.value.noneSet
        ..type = type ?? stimpack.metaNew.type.none;
  }

  @override
  void clear(StimMetaNewPreset symbol) {
    symbol
        ..values = stimpack.metaNew.value.noneSet
        ..type = stimpack.metaNew.type.none;
  }

  @override
  StimMetaNewPreset create() {
    return StimMetaNewPreset(this);
  }

  @override
  StimMetaNewPresetSet createSet(List<StimMetaNewPreset> items) {
    return StimMetaNewPresetSet(this, items);
  }
}
