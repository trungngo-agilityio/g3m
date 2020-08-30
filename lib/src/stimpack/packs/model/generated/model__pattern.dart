part of g3.stimpack.model.generated;



class StimModelPattern extends StimSymbol<StimModelPattern, StimModelPatternSet> {
  StimModelPattern(_StimModelPatternScopeImpl scope):
      super(scope);


  @override
  StimModelPattern clone() {
    return super.clone();
  }
}


class StimModelPatternSet extends StimSymbolSet<StimModelPattern, StimModelPatternSet> {
  final _StimModelPatternScopeImpl _scope;

  StimModelPatternSet(this._scope, List<StimModelPattern> items):
      super(_scope, items);
}


abstract class StimModelPatternScope extends StimScope<StimModelPattern, StimModelPatternSet> {
  StimModelPattern of(name);
}


class _StimModelPatternScopeImpl extends StimScopeImpl<StimModelPattern, StimModelPatternSet> implements StimModelPatternScope {
  _StimModelPatternScopeImpl():
      super();


  @override
  StimModelPattern of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimModelPattern symbol) {
    symbol;
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
