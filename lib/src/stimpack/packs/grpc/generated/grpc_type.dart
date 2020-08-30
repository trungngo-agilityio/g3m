part of g3.stimpack.grpc.generated;



class StimModelType extends StimSymbol<StimModelType, StimModelTypeSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimModelType(_StimModelTypeScopeImpl scope):
      super(scope);


  @override
  StimModelType clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimModelTypeSet extends StimSymbolSet<StimModelType, StimModelTypeSet> {
  final _StimModelTypeScopeImpl _scope;

  StimModelTypeXRangeSetOp _range;

  StimModelTypeXPatternsSetOp _patterns;

  StimModelTypeXRangeSetOp get range {
    return _range ??= StimModelTypeXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimModelTypeXRangeSetOp value) {
    _range = value;
  }
  StimModelTypeXPatternsSetOp get patterns {
    return _patterns ??= StimModelTypeXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimModelTypeXPatternsSetOp value) {
    _patterns = value;
  }
  StimModelTypeSet(this._scope, List<StimModelType> items):
      super(_scope, items);
}


abstract class StimModelTypeScope extends StimScope<StimModelType, StimModelTypeSet> {
  StimModelType of(name, {dynamic range, dynamic patterns});
}


class _StimModelTypeScopeImpl extends StimScopeImpl<StimModelType, StimModelTypeSet> implements StimModelTypeScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  _StimModelTypeScopeImpl():
      super();


  @override
  StimModelType of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimModelType symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet;
  }

  @override
  StimModelType create() {
    return StimModelType(this);
  }

  @override
  StimModelTypeSet createSet(List<StimModelType> items) {
    return StimModelTypeSet(this, items);
  }
}
