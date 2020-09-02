part of g3.stimpack.model.generated;

class StimModelRange extends StimSymbol<StimModelRange, StimModelRangeSet> {
  StimModelRange(_StimModelRangeScopeImpl scope) : super(scope);

  @override
  StimModelRange clone() {
    return super.clone();
  }
}

class StimModelRangeSet
    extends StimSymbolSet<StimModelRange, StimModelRangeSet> {
  final _StimModelRangeScopeImpl _scope;

  StimModelRangeSet(this._scope, List<StimModelRange> items)
      : super(_scope, items);
}

abstract class StimModelRangeScope
    extends StimScope<StimModelRange, StimModelRangeSet> {
  StimModelRange of(name);
}

class _StimModelRangeScopeImpl
    extends StimScopeImpl<StimModelRange, StimModelRangeSet>
    implements StimModelRangeScope {
  _StimModelRangeScopeImpl() : super();

  @override
  StimModelRange of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimModelRange symbol) {
    symbol;
  }

  @override
  StimModelRange create() {
    return StimModelRange(this);
  }

  @override
  StimModelRangeSet createSet(List<StimModelRange> items) {
    return StimModelRangeSet(this, items);
  }
}
