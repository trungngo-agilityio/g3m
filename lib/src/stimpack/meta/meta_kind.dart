part of g3.stimpack.meta;

class StimMetaKind extends StimSymbol<StimMetaKind, _StimMetaKindSet> {
  StimMetaKind._(_StimMetaScopeImpl scope) : super(scope);
}

class _StimMetaKindSet extends StimSymbolSet<StimMetaKind, _StimMetaKindSet> {
  final _StimMetaPackImpl _pack;

  _StimMetaKindSet._(this._pack, List<StimMetaKind> items)
      : super(_pack._kind, items);
}

abstract class _StimMetaKindScope
    implements StimScope<StimMetaKind, _StimMetaKindSet> {
  StimMetaKind of(dynamic name, {dynamic fields});

  StimMetaKind list;
}

class _StimMetaScopeImpl extends StimScopeImpl<StimMetaKind, _StimMetaKindSet>
    implements _StimMetaKindScope {
  final _StimMetaPackImpl _pack;

  _StimMetaScopeImpl._(this._pack);

  @override
  void clear(StimMetaKind symbol) {}

  @override
  StimMetaKind create() => StimMetaKind._(this);

  @override
  StimMetaKind of(name, {dynamic fields}) {
    return createAndClear(name);
  }

  @override
  _StimMetaKindSet createSet(List<StimMetaKind> items) =>
      _StimMetaKindSet._(_pack, items);

  @override
  StimMetaKind list;
}
