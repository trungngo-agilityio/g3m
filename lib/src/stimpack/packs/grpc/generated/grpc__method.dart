part of g3.stimpack.grpc.generated;



class StimGrpcMethod extends StimSymbol<StimGrpcMethod, StimGrpcMethodSet> {
  StimGrpcMethodRequest request;

  StimGrpcMethodResponse response;

  StimGrpcMethod(_StimGrpcMethodScopeImpl scope):
      super(scope);


  @override
  StimGrpcMethod clone() {
    return super.clone()
        ..request = request.clone()
        ..response = response.clone();
  }
}


class StimGrpcMethodSet extends StimSymbolSet<StimGrpcMethod, StimGrpcMethodSet> {
  final _StimGrpcMethodScopeImpl _scope;

  StimGrpcMethodXRequestOp _request;

  StimGrpcMethodXResponseOp _response;

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
  StimGrpcMethod of(name, {dynamic request, dynamic response});
}


class _StimGrpcMethodScopeImpl extends StimScopeImpl<StimGrpcMethod, StimGrpcMethodSet> implements StimGrpcMethodScope {
  StimGrpcMethodRequest request;

  StimGrpcMethodResponse response;

  _StimGrpcMethodScopeImpl():
      super();


  @override
  StimGrpcMethod of(name, {dynamic request, dynamic response}) {
    return createAndClear(name)
        ..request = request ?? stimpack.grpc.methodRequest.none
        ..response = response ?? stimpack.grpc.methodResponse.none;
  }

  @override
  void clear(StimGrpcMethod symbol) {
    symbol
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
