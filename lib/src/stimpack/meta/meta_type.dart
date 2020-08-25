part of g3.stimpack.meta;

class StimMetaType extends StimSymbol<StimMetaType, _StimMetaTypeSet> {
  StimMetaType._(_StimMetaTypeScopeImpl scope) : super(scope);

  _StimMetaFieldSet fields;

  @override
  StimMetaType clone() {
    return super.clone()..fields = fields.clone();
  }
}

class _StimMetaTypeSet extends StimSymbolSet<StimMetaType, _StimMetaTypeSet> {
  final _StimMetaPackImpl _pack;

  _StimMetaTypeSet._(this._pack, List<StimMetaType> items)
      : super(_pack._type, items);

  _StimMetaType_FieldSetOp _fields;

  _StimMetaType_FieldSetOp get fields =>
      _fields ??= _StimMetaType_FieldSetOp(this, _pack.field);

  set fields(_StimMetaType_FieldSetOp value) => _fields = value;
}

abstract class _StimMetaTypeScope
    implements StimScope<StimMetaType, _StimMetaTypeSet> {
  StimMetaType of(dynamic name, {dynamic fields});
}

class _StimMetaTypeScopeImpl
    extends StimScopeImpl<StimMetaType, _StimMetaTypeSet>
    implements _StimMetaTypeScope {
  final _StimMetaPackImpl _pack;

  _StimMetaTypeScopeImpl._(this._pack);

  @override
  void clear(StimMetaType symbol) {
    symbol..fields = _pack.field.noneSet;
  }

  @override
  StimMetaType create() => StimMetaType._(this);

  @override
  StimMetaType of(name, {dynamic fields}) {
    return createAndClear(name)..fields = fields ?? _pack.field.noneSet;
  }

  @override
  _StimMetaTypeSet createSet(List<StimMetaType> items) =>
      _StimMetaTypeSet._(_pack, items);
}
