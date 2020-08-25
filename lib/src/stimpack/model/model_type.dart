part of g3.stimpack.model;

class StimType extends StimSymbol<StimType, _StimTypeSet> {
  StimType._(_StimTypeScopeImpl scope) : super(scope);

  _StimFieldSet fields;

  @override
  StimType clone() {
    return super.clone()..fields = fields.clone();
  }
}

class _StimTypeSet extends StimSymbolSet<StimType, _StimTypeSet> {
  final _StimModelPackImpl _pack;

  _StimTypeSet._(this._pack, List<StimType> items) : super(_pack._type, items);

  _StimType_FieldSetOp _fields;

  _StimType_FieldSetOp get fields =>
      _fields ??= _StimType_FieldSetOp(this, _pack.field);

  set fields(_StimType_FieldSetOp value) => _fields = value;
}

abstract class _StimTypeScope implements StimScope<StimType, _StimTypeSet> {
  StimType of(dynamic name, {dynamic fields});
}

class _StimTypeScopeImpl extends StimScopeImpl<StimType, _StimTypeSet>
    implements _StimTypeScope {
  final _StimModelPackImpl _pack;

  _StimTypeScopeImpl._(this._pack);

  @override
  void clear(StimType symbol) {
    symbol..fields = _pack.field.noneSet;
  }

  @override
  StimType create() => StimType._(this);

  @override
  StimType of(name, {dynamic fields}) {
    return createAndClear(name)..fields = fields ?? _pack.field.noneSet;
  }

  @override
  _StimTypeSet createSet(List<StimType> items) => _StimTypeSet._(_pack, items);
}
