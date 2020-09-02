part of g3.stimpack.meta.generated;

class StimMetaKind extends StimSymbol<StimMetaKind, StimMetaKindSet> {
  StimMetaKind(_StimMetaKindScopeImpl scope) : super(scope);

  @override
  StimMetaKind clone() {
    return super.clone();
  }
}

class StimMetaKindSet extends StimSymbolSet<StimMetaKind, StimMetaKindSet> {
  final _StimMetaKindScopeImpl _scope;

  StimMetaKindSet(this._scope, List<StimMetaKind> items) : super(_scope, items);
}

abstract class StimMetaKindScope
    extends StimScope<StimMetaKind, StimMetaKindSet> {
  StimMetaKind get set;

  StimMetaKind of(name);
}

class _StimMetaKindScopeImpl
    extends StimScopeImpl<StimMetaKind, StimMetaKindSet>
    implements StimMetaKindScope {
  StimMetaKind _set;

  @override
  StimMetaKind get set {
    return _set ??= of('set');
  }

  _StimMetaKindScopeImpl() : super();

  @override
  StimMetaKind of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimMetaKind symbol) {
    symbol;
  }

  @override
  StimMetaKind create() {
    return StimMetaKind(this);
  }

  @override
  StimMetaKindSet createSet(List<StimMetaKind> items) {
    return StimMetaKindSet(this, items);
  }
}
