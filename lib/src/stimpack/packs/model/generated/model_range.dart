part of g3.stimpack.model.generated;



class StimModelRange extends StimSymbol<StimModelRange, StimModelRangeSet> {
  StimModelRange(_StimModelRangeScopeImpl scope):
      super(scope);


  @override
  StimModelRange clone() {
    return super.clone();
  }
}


class StimModelRangeSet extends StimSymbolSet<StimModelRange, StimModelRangeSet> {
  final _StimModelModelImpl _pack;

  StimModelRangeSet(this._pack, List<StimModelRange> items):
      super(_pack._range, items);
}


abstract class StimModelRangeScope extends StimScope<StimModelRange, StimModelRangeSet> {
  StimModelRangeSymbols get s;

  StimModelRange of(name);
}


class _StimModelRangeScopeImpl extends StimScopeImpl<StimModelRange, StimModelRangeSet> implements StimModelRangeScope {
  final _StimModelModelImpl _pack;

  StimModelRangeSymbols _s;

  @override
  StimModelRangeSymbols get s {
    return _s ??= StimModelRangeSymbols(this);
  }
  _StimModelRangeScopeImpl(this._pack):
      super();


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
    return StimModelRangeSet(_pack, items);
  }
}


class StimModelRangeSymbols {
  StimModelRangeSet all;


  StimModelRangeSymbols(StimModelRangeScope scope) {
    all = scope.noneSet;
  }
}
