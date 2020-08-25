part of g3.stimpack.meta;

class StimMetaField extends StimSymbol<StimMetaField, _StimMetaFieldSet> {
  /// The field type.
  StimMetaType type;

  /// Defines the field kind.
  /// If this is none, then the field is singular kind.
  /// Otherwise it is a collection. E.g., list of .
  StimMetaKind kind;

  StimMetaField._(StimScopeImpl<StimMetaField, _StimMetaFieldSet> scope)
      : super(scope);

  @override
  StimMetaField clone() {
    return super.clone()
      ..kind = kind.clone()
      ..type = type.clone();
  }
}

class _StimMetaFieldSet
    extends StimSymbolSet<StimMetaField, _StimMetaFieldSet> {
  final _StimMetaPackImpl _pack;

  _StimMetaFieldSet._(this._pack, List<StimMetaField> items)
      : super(_pack._field, items);

  _StimMetaField_TypeOp _type;

  _StimMetaField_TypeOp get type =>
      _type ??= _StimMetaField_TypeOp(this, _pack.type);

  set type(_StimMetaField_TypeOp value) => _type = value;

  _StimMetaField_KindOp _kind;

  _StimMetaField_KindOp get kind =>
      _kind ??= _StimMetaField_KindOp(this, _pack.kind);

  set kind(_StimMetaField_KindOp value) => _kind = value;
}

abstract class _StimMetaFieldScope
    extends StimScope<StimMetaField, _StimMetaFieldSet> {
  StimMetaField of(dynamic name, {dynamic kind, dynamic type});
}

class _StimMetaFieldScopeImpl
    extends StimScopeImpl<StimMetaField, _StimMetaFieldSet>
    implements _StimMetaFieldScope {
  final _StimMetaPackImpl _pack;

  _StimMetaFieldScopeImpl._(this._pack) : super();

  @override
  void clear(StimMetaField symbol) {
    symbol
      ..kind = _pack.kind.none
      ..type = _pack.type.none;
  }

  @override
  StimMetaField create() => StimMetaField._(this);

  @override
  StimMetaField of(dynamic name, {dynamic kind, dynamic type}) {
    return createAndClear(name)
      ..kind = kind ?? _pack.kind.none
      ..type = type ?? _pack.type.none;
  }

  @override
  _StimMetaFieldSet createSet(List<StimMetaField> items) {
    return _StimMetaFieldSet._(_pack, items);
  }
}
