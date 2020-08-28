part of g3.stimpack.meta.generated;

class StimMetaKind extends StimSymbol<StimMetaKind, StimMetaKindSet> {
  StimMetaKind._(_StimMetaKindScopeImpl scope) : super(scope);

  @override
  StimMetaKind clone() {
    return super.clone();
  }
}

class StimMetaKindSet extends StimSymbolSet<StimMetaKind, StimMetaKindSet> {
  final _StimMetaMetaImpl __pack;

  StimMetaKindSet._(this.__pack, List<StimMetaKind> items)
      : super(__pack._kind, items);
}

abstract class StimMetaKindScope
    extends StimScope<StimMetaKind, StimMetaKindSet> {
  StimMetaKindSymbols get s;

  StimMetaKind of(dynamic name);
}

class StimMetaKindSymbols {
  final _StimMetaKindScopeImpl _scope;

  /// All symbols
  StimMetaKindSet all;
  StimMetaKind list;

  StimMetaKindSymbols(this._scope) {
    final _s = stimpack.meta.kind;
    all = _s.noneSet;
    all += list = _s.of('list');
  }
}

class _StimMetaKindScopeImpl
    extends StimScopeImpl<StimMetaKind, StimMetaKindSet>
    implements StimMetaKindScope {
  final _StimMetaMetaImpl __pack;

  _StimMetaKindScopeImpl._(this.__pack) : super();

  StimMetaKindSymbols _s;

  @override
  StimMetaKindSymbols get s => _s ??= StimMetaKindSymbols(this);

  @override
  void clear(StimMetaKind symbol) {}

  @override
  StimMetaKind create() => StimMetaKind._(this);

  @override
  StimMetaKind of(dynamic name) {
    return createAndClear(name);
  }

  @override
  StimMetaKindSet createSet(List<StimMetaKind> items) {
    return StimMetaKindSet._(__pack, items);
  }
}
