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

class _StimFieldTypeOp extends StimSymbolOpImpl<_StimField, _StimFieldSet,
    _StimType, _StimTypeSet> {
  _StimFieldTypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<_StimType, _StimTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(_StimField child, _StimType value) {
    child.type = value;
  }
}

class _StimFieldTypeSetOp extends StimSymbolSetOpImpl<_StimField, _StimFieldSet,
    _StimType, _StimTypeSet> {
  _StimFieldTypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<_StimType, _StimTypeSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(_StimField child, _StimTypeSet items) {
    child.types = child.types == null ? items : child.types += items;
  }

  @override
  void onSet(_StimField child, _StimTypeSet items) {
    child.types = items;
  }
}

class _StimFieldSet extends StimSymbolSet<_StimField, _StimFieldSet> {
  final _StimBasePackImpl _pack;

  _StimFieldSet._(this._pack, List<_StimField> items)
      : super(_pack._field, items);

  _StimFieldTypeOp _type;

  _StimFieldTypeOp get type => _type ??= _StimFieldTypeOp(this, _pack.type);

  set type(_StimFieldTypeOp value) => _type = value;

  _StimFieldTypeSetOp _types;

  _StimFieldTypeSetOp get types =>
      _types ??= _StimFieldTypeSetOp(this, _pack.type);

  set types(_StimFieldTypeSetOp value) => _types = value;
}

abstract class _StimFieldScope extends StimScope<_StimField, _StimFieldSet> {
  _StimField of(dynamic name, {_StimType type});
}

class _StimFieldScopeImpl extends StimScopeImpl<_StimField, _StimFieldSet>
    implements _StimFieldScope {
  final _StimBasePackImpl _pack;

  _StimFieldScopeImpl._(this._pack) : super();

  @override
  void clear(_StimField symbol) {
    final scope = _pack.type;
    symbol
      ..type = scope.none
      ..types = scope.noneSet;
  }

  @override
  _StimField create() => _StimField._(this);

  @override
  _StimField of(dynamic name, {dynamic type, dynamic types}) {
    final scope = _pack.type;
    return createAndClear(name)
      ..type = type ?? scope.none
      ..types = types ?? scope.noneSet;
  }

  @override
  _StimFieldSet createSet(List<_StimField> items) {
    return _StimFieldSet._(_pack, items);
  }
}
