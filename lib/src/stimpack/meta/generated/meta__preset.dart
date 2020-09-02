part of g3.stimpack.meta.generated;

class StimMetaPreset extends StimSymbol<StimMetaPreset, StimMetaPresetSet> {
  StimMetaValueSet values;

  StimMetaType type;

  StimMetaPreset(_StimMetaPresetScopeImpl scope) : super(scope);

  @override
  StimMetaPreset clone() {
    return super.clone()
      ..values = values.clone()
      ..type = type.clone();
  }
}

class StimMetaPresetSet
    extends StimSymbolSet<StimMetaPreset, StimMetaPresetSet> {
  final _StimMetaPresetScopeImpl _scope;

  StimMetaPresetXValuesSetOp _values;

  StimMetaPresetXTypeOp _type;

  StimMetaPresetXValuesSetOp get values {
    return _values ??= StimMetaPresetXValuesSetOp(this, stimpack.meta.value);
  }

  set values(StimMetaPresetXValuesSetOp value) {
    _values = value;
  }

  StimMetaPresetXTypeOp get type {
    return _type ??= StimMetaPresetXTypeOp(this, stimpack.meta.type);
  }

  set type(StimMetaPresetXTypeOp value) {
    _type = value;
  }

  StimMetaPresetSet(this._scope, List<StimMetaPreset> items)
      : super(_scope, items);
}

abstract class StimMetaPresetScope
    extends StimScope<StimMetaPreset, StimMetaPresetSet> {
  StimMetaPreset of(name, {dynamic values, dynamic type});
}

class _StimMetaPresetScopeImpl
    extends StimScopeImpl<StimMetaPreset, StimMetaPresetSet>
    implements StimMetaPresetScope {
  StimMetaValueSet values;

  StimMetaType type;

  _StimMetaPresetScopeImpl() : super();

  @override
  StimMetaPreset of(name, {dynamic values, dynamic type}) {
    return createAndClear(name)
      ..values += values ?? stimpack.meta.value.noneSet
      ..type = type ?? stimpack.meta.type.none;
  }

  @override
  void clear(StimMetaPreset symbol) {
    symbol
      ..values = stimpack.meta.value.noneSet
      ..type = stimpack.meta.type.none;
  }

  @override
  StimMetaPreset create() {
    return StimMetaPreset(this);
  }

  @override
  StimMetaPresetSet createSet(List<StimMetaPreset> items) {
    return StimMetaPresetSet(this, items);
  }
}
