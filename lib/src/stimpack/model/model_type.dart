part of g3.stimpack.model;

class _StimType extends StimSymbol<_StimType, _StimTypeSet> {
  _StimType._(_StimTypeScopeImpl scope) : super(scope);
}

class _StimTypeSet extends StimSymbolSet<_StimType, _StimTypeSet> {
  _StimTypeSet._(_StimTypeScopeImpl scope, List<_StimType> items)
      : super(scope, items);
}

abstract class _StimTypeScope implements StimScope<_StimType, _StimTypeSet> {
  _StimType of(dynamic name);
}

class _StimTypeScopeImpl extends StimScopeImpl<_StimType, _StimTypeSet>
    implements _StimTypeScope {
  final _StimBasePackImpl _pack;

  _StimTypeScopeImpl._(this._pack);

  @override
  void clear(_StimType symbol) {}

  @override
  _StimType create() => _StimType._(this);

  @override
  _StimType of(name) {
    return createAndClear(name);
  }

  @override
  _StimTypeSet createSet(List<_StimType> items) => _StimTypeSet._(this, items);
}
