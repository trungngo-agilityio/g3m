part of g3.stimpack.model;

class _StimField extends StimSymbol<_StimField, _StimFieldSet> {
  _StimType type;

  _StimTypeSet types;

  _StimField._(StimScopeImpl<_StimField, _StimFieldSet> scope) : super(scope);

  @override
  _StimField clone() {
    return super.clone()
      ..type = type.clone()
      ..types = types.clone();
  }
}

class _StimFieldSet extends StimSymbolSet<_StimField, _StimFieldSet> {
  final _StimModelPackImpl _pack;

  _StimFieldSet._(this._pack, List<_StimField> items)
      : super(_pack._field, items);

  _StimField_TypeOp _type;

  _StimField_TypeOp get type => _type ??= _StimField_TypeOp(this, _pack.type);

  set type(_StimField_TypeOp value) => _type = value;

  _StimField_TypeSetOp _types;

  _StimField_TypeSetOp get types =>
      _types ??= _StimField_TypeSetOp(this, _pack.type);

  set types(_StimField_TypeSetOp value) => _types = value;
}

abstract class _StimFieldScope extends StimScope<_StimField, _StimFieldSet> {
  _StimField of(dynamic name, {dynamic type, dynamic types});
}

class _StimFieldScopeImpl extends StimScopeImpl<_StimField, _StimFieldSet>
    implements _StimFieldScope {
  final _StimModelPackImpl _pack;

  _StimFieldScopeImpl._(this._pack) : super();

  @override
  void clear(_StimField symbol) {
    symbol
      ..type = _pack.type.none
      ..types = _pack.type.noneSet;
  }

  @override
  _StimField create() => _StimField._(this);

  @override
  _StimField of(dynamic name, {dynamic type, dynamic types}) {
    return createAndClear(name)
      ..type = type ?? _pack.type.none
      ..types += types;
  }

  @override
  _StimFieldSet createSet(List<_StimField> items) {
    return _StimFieldSet._(_pack, items);
  }
}
