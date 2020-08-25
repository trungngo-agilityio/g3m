part of g3.stimpack.model;

class StimValue extends StimSymbol<StimValue, _StimValueSet> {
  StimValue._(_StimValueScopeImpl scope) : super(scope);
}

class _StimValueSet extends StimSymbolSet<StimValue, _StimValueSet> {
  final _StimModelPackImpl _pack;

  _StimValueSet._(this._pack, List<StimValue> items)
      : super(_pack._value, items);
}

abstract class _StimValueScope implements StimScope<StimValue, _StimValueSet> {
  StimValue of(dynamic name, {dynamic fields});
}

class _StimValueScopeImpl extends StimScopeImpl<StimValue, _StimValueSet>
    implements _StimValueScope {
  final _StimModelPackImpl _pack;

  _StimValueScopeImpl._(this._pack);

  @override
  void clear(StimValue symbol) {}

  @override
  StimValue create() => StimValue._(this);

  @override
  StimValue of(name, {dynamic fields}) {
    return createAndClear(name);
  }

  @override
  _StimValueSet createSet(List<StimValue> items) =>
      _StimValueSet._(_pack, items);
}
