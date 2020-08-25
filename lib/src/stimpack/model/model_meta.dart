part of g3.stimpack.model;

class StimPack extends StimSymbol<StimPack, _StimPackSet> {
  _StimTypeSet types;

  StimPack._(StimScopeImpl<StimPack, _StimPackSet> scope) : super(scope);

  @override
  StimPack clone() {
    return super.clone()..types = types.clone();
  }
}

class _StimPackSet extends StimSymbolSet<StimPack, _StimPackSet> {
  final _StimModelPackImpl _pack;

  _StimPackSet._(this._pack, List<StimPack> items) : super(_pack._pack, items);

  _StimPack_TypeSetOp _types;

  _StimPack_TypeSetOp get types =>
      _types ??= _StimPack_TypeSetOp(this, _pack.type);

  set types(_StimPack_TypeSetOp value) => _types = value;
}

abstract class _StimPackScope extends StimScope<StimPack, _StimPackSet> {
  StimPack of(dynamic name, {dynamic types});
}

class _StimPackScopeImpl extends StimScopeImpl<StimPack, _StimPackSet>
    implements _StimPackScope {
  final _StimModelPackImpl _pack;

  _StimPackScopeImpl._(this._pack) : super();

  @override
  void clear(StimPack symbol) {
    symbol..types = _pack.type.noneSet;
  }

  @override
  StimPack create() => StimPack._(this);

  @override
  StimPack of(dynamic name, {dynamic types}) {
    return createAndClear(name)..types += types;
  }

  @override
  _StimPackSet createSet(List<StimPack> items) {
    return _StimPackSet._(_pack, items);
  }
}
