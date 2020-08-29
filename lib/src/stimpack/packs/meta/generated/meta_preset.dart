part of g3.stimpack.meta.generated;



class StimMetaPreset extends StimSymbol<StimMetaPreset, StimMetaPresetSet> {
  StimMetaValueSet values;

  StimMetaPreset(_StimMetaPresetScopeImpl scope):
      super(scope);


  @override
  StimMetaPreset clone() {
    return super.clone()
        ..values = values.clone();
  }
}


class StimMetaPresetSet extends StimSymbolSet<StimMetaPreset, StimMetaPresetSet> {
  final _StimMetaPresetScopeImpl _scope;

  StimMetaPresetXValuesSetOp _values;

  StimMetaPresetXValuesSetOp get values {
    return _values ??= StimMetaPresetXValuesSetOp(this, stimpack.meta.value);
  }

  set values(StimMetaPresetXValuesSetOp value) {
    _values = value;
  }
  StimMetaPresetSet(this._scope, List<StimMetaPreset> items):
      super(_scope, items);
}


abstract class StimMetaPresetScope extends StimScope<StimMetaPreset, StimMetaPresetSet> {
  StimMetaPresetSymbols get s;

  StimMetaPreset of(name, {dynamic values});
}


class _StimMetaPresetScopeImpl extends StimScopeImpl<StimMetaPreset, StimMetaPresetSet> implements StimMetaPresetScope {
  StimMetaPresetSymbols _s;

  StimMetaValueSet values;

  @override
  StimMetaPresetSymbols get s {
    return _s ??= StimMetaPresetSymbols(this);
  }
  _StimMetaPresetScopeImpl():
      super();


  @override
  StimMetaPreset of(name, {dynamic values}) {
    return createAndClear(name)
        ..values += values ?? stimpack.meta.value.noneSet;
  }

  @override
  void clear(StimMetaPreset symbol) {
    symbol
        ..values = stimpack.meta.value.noneSet;
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


class StimMetaPresetSymbols {
  StimMetaPresetSet all;


  StimMetaPresetSymbols(StimMetaPresetScope scope) {
    all = scope.noneSet;
  }
}
