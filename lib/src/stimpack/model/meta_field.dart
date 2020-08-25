part of g3.stimpack.model;

class StimMetaField extends StimSymbol<StimMetaField, _StimFieldSet> {
  /// The field type.
  StimType type;

  /// Defines the field kind.
  /// If this is none, then the field is singular kind.
  /// Otherwise it is a collection. E.g., list of .
  StimValue kind;

  StimMetaField._(StimScopeImpl<StimMetaField, _StimFieldSet> scope) : super(scope);

  @override
  StimMetaField clone() {
    return super.clone()
      ..kind = kind.clone()
      ..type = type.clone();
  }
}

class _StimFieldSet extends StimSymbolSet<StimMetaField, _StimFieldSet> {
  final _StimModelPackImpl _pack;

  _StimFieldSet._(this._pack, List<StimMetaField> items)
      : super(_pack._field, items);

  _StimField_TypeOp _type;

  _StimField_TypeOp get type => _type ??= _StimField_TypeOp(this, _pack.type);

  set type(_StimField_TypeOp value) => _type = value;

  _StimField_KindOp _kind;

  _StimField_KindOp get kind => _kind ??= _StimField_KindOp(this, _pack.value);

  set kind(_StimField_KindOp value) => _kind = value;
}

abstract class _StimFieldScope extends StimScope<StimMetaField, _StimFieldSet> {
  StimMetaField of(dynamic name, {dynamic kind, dynamic type});
}

class _StimFieldScopeImpl extends StimScopeImpl<StimMetaField, _StimFieldSet>
    implements _StimFieldScope {
  final _StimModelPackImpl _pack;

  _StimFieldScopeImpl._(this._pack) : super();

  @override
  void clear(StimMetaField symbol) {
    symbol
      ..kind = _pack.value.none
      ..type = _pack.type.none;
  }

  @override
  StimMetaField create() => StimMetaField._(this);

  @override
  StimMetaField of(dynamic name, {dynamic kind, dynamic type}) {
    return createAndClear(name)
      ..kind = kind ?? _pack.value.none
      ..type = type ?? _pack.type.none;
  }

  @override
  _StimFieldSet createSet(List<StimMetaField> items) {
    return _StimFieldSet._(_pack, items);
  }
}
