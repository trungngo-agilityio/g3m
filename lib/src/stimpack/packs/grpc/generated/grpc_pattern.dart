part of g3.stimpack.grpc.generated;



class StimModelPattern extends StimSymbol<StimModelPattern, StimModelPatternSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimModelPattern(_StimModelPatternScopeImpl scope):
      super(scope);


  @override
  StimModelPattern clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimModelPatternSet extends StimSymbolSet<StimModelPattern, StimModelPatternSet> {
  final _StimModelPatternScopeImpl _scope;

  StimModelPatternXRangeSetOp _range;

  StimModelPatternXPatternsSetOp _patterns;

  StimModelPatternXRangeSetOp get range {
    return _range ??= StimModelPatternXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimModelPatternXRangeSetOp value) {
    _range = value;
  }
  StimModelPatternXPatternsSetOp get patterns {
    return _patterns ??= StimModelPatternXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimModelPatternXPatternsSetOp value) {
    _patterns = value;
  }
  StimModelPatternSet(this._scope, List<StimModelPattern> items):
      super(_scope, items);
}


abstract class StimModelPatternScope extends StimScope<StimModelPattern, StimModelPatternSet> {
  StimModelPattern of(name, {dynamic range, dynamic patterns});
}


class _StimModelPatternScopeImpl extends StimScopeImpl<StimModelPattern, StimModelPatternSet> implements StimModelPatternScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  _StimModelPatternScopeImpl():
      super();


  @override
  StimModelPattern of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimModelPattern symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet;
  }

  @override
  StimModelPattern create() {
    return StimModelPattern(this);
  }

  @override
  StimModelPatternSet createSet(List<StimModelPattern> items) {
    return StimModelPatternSet(this, items);
  }
}
