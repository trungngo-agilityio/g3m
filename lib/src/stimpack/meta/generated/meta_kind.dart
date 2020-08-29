part of g3.stimpack.meta.generated;



class StimMetaKind extends StimSymbol<StimMetaKind, StimMetaKindSet> {
  StimMetaKind(_StimMetaKindScopeImpl scope):
      super(scope);


  @override
  StimMetaKind clone() {
    return super.clone();
  }
}


class StimMetaKindSet extends StimSymbolSet<StimMetaKind, StimMetaKindSet> {
  final _StimMetaKindScopeImpl _scope;

  StimMetaKindSet(this._scope, List<StimMetaKind> items):
      super(_scope, items);
}


abstract class StimMetaKindScope extends StimScope<StimMetaKind, StimMetaKindSet> {
  StimMetaKindSymbols get s;

  StimMetaKind of(name);
}


class _StimMetaKindScopeImpl extends StimScopeImpl<StimMetaKind, StimMetaKindSet> implements StimMetaKindScope {
  StimMetaKindSymbols _s;

  @override
  StimMetaKindSymbols get s {
    return _s ??= StimMetaKindSymbols(this);
  }
  _StimMetaKindScopeImpl():
      super();


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


class StimMetaKindSymbols {
  StimMetaKindSet all;


  StimMetaKindSymbols(StimMetaKindScope scope) {
    all = scope.noneSet;
  }
}


class StimMetaKindMetaPreset {
  StimMetaKindSet all;

  StimMetaKind list;


  StimMetaKindMetaPreset(StimMetaKindScope scope) {
    all = scope.noneSet;
    all += list = scope.of('list');
  }
}
StimMetaKindMetaPreset  _extStimMetaKindMetaPreset;

extension StimMetaKindMetaPresetExtension on StimMetaKindScope {
  StimMetaKindMetaPreset get forMeta {
    return _extStimMetaKindMetaPreset ??= StimMetaKindMetaPreset(stimpack.meta.kind);
  }
}
    