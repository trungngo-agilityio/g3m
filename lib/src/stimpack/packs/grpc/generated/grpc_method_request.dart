part of g3.stimpack.grpc.generated;



class StimGrpcMethodRequest extends StimSymbol<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimGrpcMethodRequest(_StimGrpcMethodRequestScopeImpl scope):
      super(scope);


  @override
  StimGrpcMethodRequest clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone();
  }
}


class StimGrpcMethodRequestSet extends StimSymbolSet<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  final _StimGrpcMethodRequestScopeImpl _scope;

  StimGrpcMethodRequestXRangeSetOp _range;

  StimGrpcMethodRequestXPatternsSetOp _patterns;

  StimGrpcMethodRequestXRangeSetOp get range {
    return _range ??= StimGrpcMethodRequestXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimGrpcMethodRequestXRangeSetOp value) {
    _range = value;
  }
  StimGrpcMethodRequestXPatternsSetOp get patterns {
    return _patterns ??= StimGrpcMethodRequestXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimGrpcMethodRequestXPatternsSetOp value) {
    _patterns = value;
  }
  StimGrpcMethodRequestSet(this._scope, List<StimGrpcMethodRequest> items):
      super(_scope, items);
}


abstract class StimGrpcMethodRequestScope extends StimScope<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  StimGrpcMethodRequest of(name, {dynamic range, dynamic patterns});
}


class _StimGrpcMethodRequestScopeImpl extends StimScopeImpl<StimGrpcMethodRequest, StimGrpcMethodRequestSet> implements StimGrpcMethodRequestScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  _StimGrpcMethodRequestScopeImpl():
      super();


  @override
  StimGrpcMethodRequest of(name, {dynamic range, dynamic patterns}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet;
  }

  @override
  void clear(StimGrpcMethodRequest symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet;
  }

  @override
  StimGrpcMethodRequest create() {
    return StimGrpcMethodRequest(this);
  }

  @override
  StimGrpcMethodRequestSet createSet(List<StimGrpcMethodRequest> items) {
    return StimGrpcMethodRequestSet(this, items);
  }
}
