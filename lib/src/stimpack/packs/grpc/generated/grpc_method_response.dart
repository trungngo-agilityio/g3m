part of g3.stimpack.grpc.generated;



class StimGrpcMethodResponse extends StimSymbol<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimGrpcMethodResponse(_StimGrpcMethodResponseScopeImpl scope):
      super(scope);


  @override
  StimGrpcMethodResponse clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimGrpcMethodResponseSet extends StimSymbolSet<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  final _StimGrpcMethodResponseScopeImpl _scope;

  StimGrpcMethodResponseXRangeSetOp _range;

  StimGrpcMethodResponseXPatternsSetOp _patterns;

  StimGrpcMethodResponseXRangeSetOp get range {
    return _range ??= StimGrpcMethodResponseXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimGrpcMethodResponseXRangeSetOp value) {
    _range = value;
  }
  StimGrpcMethodResponseXPatternsSetOp get patterns {
    return _patterns ??= StimGrpcMethodResponseXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimGrpcMethodResponseXPatternsSetOp value) {
    _patterns = value;
  }
  StimGrpcMethodResponseSet(this._scope, List<StimGrpcMethodResponse> items):
      super(_scope, items);
}


abstract class StimGrpcMethodResponseScope extends StimScope<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimGrpcMethodResponse of(name, {dynamic range, dynamic patterns});
}


class _StimGrpcMethodResponseScopeImpl extends StimScopeImpl<StimGrpcMethodResponse, StimGrpcMethodResponseSet> implements StimGrpcMethodResponseScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  _StimGrpcMethodResponseScopeImpl():
      super();


  @override
  StimGrpcMethodResponse of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimGrpcMethodResponse symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet;
  }

  @override
  StimGrpcMethodResponse create() {
    return StimGrpcMethodResponse(this);
  }

  @override
  StimGrpcMethodResponseSet createSet(List<StimGrpcMethodResponse> items) {
    return StimGrpcMethodResponseSet(this, items);
  }
}
