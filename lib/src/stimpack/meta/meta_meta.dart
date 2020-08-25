part of g3.stimpack.meta;

class StimMetaPack extends StimSymbol<StimMetaPack, _StimMetaPackSet> {
  _StimMetaTypeSet types;

  StimMetaPack._(StimScopeImpl<StimMetaPack, _StimMetaPackSet> scope)
      : super(scope);

  @override
  StimMetaPack clone() {
    return super.clone()..types = types.clone();
  }
}

class _StimMetaPackSet extends StimSymbolSet<StimMetaPack, _StimMetaPackSet> {
  final _StimMetaPackImpl _pack;

  _StimMetaPackSet._(this._pack, List<StimMetaPack> items)
      : super(_pack._pack, items);

  _StimMetaPack_TypeSetOp _types;

  _StimMetaPack_TypeSetOp get types =>
      _types ??= _StimMetaPack_TypeSetOp(this, _pack.type);

  set types(_StimMetaPack_TypeSetOp value) => _types = value;
}

abstract class _StimMetaPackScope
    extends StimScope<StimMetaPack, _StimMetaPackSet> {
  StimMetaPack of(dynamic name, {dynamic types});
}

class _StimPackScopeImpl extends StimScopeImpl<StimMetaPack, _StimMetaPackSet>
    implements _StimMetaPackScope {
  final _StimMetaPackImpl _pack;

  _StimPackScopeImpl._(this._pack) : super();

  @override
  void clear(StimMetaPack symbol) {
    symbol..types = _pack.type.noneSet;
  }

  @override
  StimMetaPack create() => StimMetaPack._(this);

  @override
  StimMetaPack of(dynamic name, {dynamic types}) {
    return createAndClear(name)..types += types;
  }

  @override
  _StimMetaPackSet createSet(List<StimMetaPack> items) {
    return _StimMetaPackSet._(_pack, items);
  }
}
