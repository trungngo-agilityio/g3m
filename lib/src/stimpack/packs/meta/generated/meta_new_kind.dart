part of g3.stimpack.meta_new.generated;



class StimMetaNewKind extends StimSymbol<StimMetaNewKind, StimMetaNewKindSet> {
  StimMetaNewKind(_StimMetaNewKindScopeImpl scope):
      super(scope);


  @override
  StimMetaNewKind clone() {
    return super.clone();
  }
}


class StimMetaNewKindSet extends StimSymbolSet<StimMetaNewKind, StimMetaNewKindSet> {
  final _StimMetaNewKindScopeImpl _scope;

  StimMetaNewKindSet(this._scope, List<StimMetaNewKind> items):
      super(_scope, items);
}


abstract class StimMetaNewKindScope extends StimScope<StimMetaNewKind, StimMetaNewKindSet> {
  StimMetaNewKind of(name);
}


class _StimMetaNewKindScopeImpl extends StimScopeImpl<StimMetaNewKind, StimMetaNewKindSet> implements StimMetaNewKindScope {
  _StimMetaNewKindScopeImpl():
      super();


  @override
  StimMetaNewKind of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimMetaNewKind symbol) {
    symbol;
  }

  @override
  StimMetaNewKind create() {
    return StimMetaNewKind(this);
  }

  @override
  StimMetaNewKindSet createSet(List<StimMetaNewKind> items) {
    return StimMetaNewKindSet(this, items);
  }
}
