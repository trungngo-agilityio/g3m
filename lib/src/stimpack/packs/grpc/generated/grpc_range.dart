part of g3.stimpack.grpc.generated;



class StimModelRange extends StimSymbol<StimModelRange, StimModelRangeSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimModelRange(_StimModelRangeScopeImpl scope):
      super(scope);


  @override
  StimModelRange clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimModelRangeSet extends StimSymbolSet<StimModelRange, StimModelRangeSet> {
  final _StimModelRangeScopeImpl _scope;

  StimModelRangeXRangeSetOp _range;

  StimModelRangeXPatternsSetOp _patterns;

  StimModelRangeXRangeSetOp get range {
    return _range ??= StimModelRangeXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimModelRangeXRangeSetOp value) {
    _range = value;
  }
  StimModelRangeXPatternsSetOp get patterns {
    return _patterns ??= StimModelRangeXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimModelRangeXPatternsSetOp value) {
    _patterns = value;
  }
  StimModelRangeSet(this._scope, List<StimModelRange> items):
      super(_scope, items);
}


abstract class StimModelRangeScope extends StimScope<StimModelRange, StimModelRangeSet> {
  StimModelRange of(name, {dynamic range, dynamic patterns});
}


class _StimModelRangeScopeImpl extends StimScopeImpl<StimModelRange, StimModelRangeSet> implements StimModelRangeScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  _StimModelRangeScopeImpl():
      super();


  @override
  StimModelRange of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimModelRange symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet;
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
