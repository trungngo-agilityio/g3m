part of g3.stimpack.grpc.generated;



class StimGrpcMethod extends StimSymbol<StimGrpcMethod, StimGrpcMethodSet> {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimGrpcMethodRequest request;

  StimGrpcMethodResponse response;

  StimGrpcMethod(_StimGrpcMethodScopeImpl scope):
      super(scope);


  @override
  StimGrpcMethod clone() {
    return super.clone()
        ..range = range.clone()
        ..patterns = patterns.clone()
        ..request = request.clone()
        ..response = response.clone();
  }
}


class StimGrpcMethodSet extends StimSymbolSet<StimGrpcMethod, StimGrpcMethodSet> {
  final _StimGrpcMethodScopeImpl _scope;

  StimGrpcMethodXRangeSetOp _range;

  StimGrpcMethodXPatternsSetOp _patterns;

  StimGrpcMethodXRequestOp _request;

  StimGrpcMethodXResponseOp _response;

  StimGrpcMethodXRangeSetOp get range {
    return _range ??= StimGrpcMethodXRangeSetOp(this, stimpack.model.range);
  }

  set range(StimGrpcMethodXRangeSetOp value) {
    _range = value;
  }
  StimGrpcMethodXPatternsSetOp get patterns {
    return _patterns ??= StimGrpcMethodXPatternsSetOp(this, stimpack.model.pattern);
  }

  set patterns(StimGrpcMethodXPatternsSetOp value) {
    _patterns = value;
  }
  StimGrpcMethodXRequestOp get request {
    return _request ??= StimGrpcMethodXRequestOp(this, stimpack.grpc.methodRequest);
  }

  set request(StimGrpcMethodXRequestOp value) {
    _request = value;
  }
  StimGrpcMethodXResponseOp get response {
    return _response ??= StimGrpcMethodXResponseOp(this, stimpack.grpc.methodResponse);
  }

  set response(StimGrpcMethodXResponseOp value) {
    _response = value;
  }
  StimGrpcMethodSet(this._scope, List<StimGrpcMethod> items):
      super(_scope, items);
}


abstract class StimGrpcMethodScope extends StimScope<StimGrpcMethod, StimGrpcMethodSet> {
  StimGrpcMethod of(name, {dynamic range, dynamic patterns, dynamic request, dynamic response});
}


class _StimGrpcMethodScopeImpl extends StimScopeImpl<StimGrpcMethod, StimGrpcMethodSet> implements StimGrpcMethodScope {
  StimModelRangeSet range;

  StimModelPatternSet patterns;

  StimGrpcMethodRequest request;

  StimGrpcMethodResponse response;

  _StimGrpcMethodScopeImpl():
      super();


  @override
  StimGrpcMethod of(name, {dynamic range, dynamic patterns, dynamic request, dynamic response}) {
    return createAndClear(name)
        ..range += range ?? stimpack.model.range.noneSet
        ..patterns += patterns ?? stimpack.model.pattern.noneSet
        ..request = request ?? stimpack.grpc.methodRequest.none
        ..response = response ?? stimpack.grpc.methodResponse.none;
  }

  @override
  void clear(StimGrpcMethod symbol) {
    symbol
        ..range = stimpack.model.range.noneSet
        ..patterns = stimpack.model.pattern.noneSet
        ..request = stimpack.grpc.methodRequest.none
        ..response = stimpack.grpc.methodResponse.none;
  }

  @override
  StimGrpcMethod create() {
    return StimGrpcMethod(this);
  }

  @override
  StimGrpcMethodSet createSet(List<StimGrpcMethod> items) {
    return StimGrpcMethodSet(this, items);
  }
}
