part of g3.stimpack.model;

class _StimType extends StimSymbol<_StimType, _StimTypeSet> {
  _StimType._(_StimTypeScopeImpl scope) : super(scope);

  _StimFieldSet fields;

  @override
  _StimType clone() {
    return super.clone()..fields = fields.clone();
  }
}

class _StimTypeSet extends StimSymbolSet<_StimType, _StimTypeSet> {
  final _StimModelPackImpl _pack;

  _StimTypeSet._(this._pack, List<_StimType> items) : super(_pack._type, items);

  _StimType_FieldSetOp _fields;

  _StimType_FieldSetOp get fields =>
      _fields ??= _StimType_FieldSetOp(this, _pack.field);

  set fields(_StimType_FieldSetOp value) => _fields = value;
}

abstract class _StimTypeScope implements StimScope<_StimType, _StimTypeSet> {
  _StimType of(dynamic name, {dynamic fields});
}

class _StimTypeScopeImpl extends StimScopeImpl<_StimType, _StimTypeSet>
    implements _StimTypeScope {
  final _StimModelPackImpl _pack;

  _StimTypeScopeImpl._(this._pack);

  @override
  void clear(_StimType symbol) {
    symbol..fields = _pack.field.noneSet;
  }

  @override
  _StimType create() => _StimType._(this);

  @override
  _StimType of(name, {dynamic fields}) {
    return createAndClear(name)..fields = fields ?? _pack.field.noneSet;
  }

  @override
  _StimTypeSet createSet(List<_StimType> items) => _StimTypeSet._(_pack, items);
}
