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
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMethodXRequestOp _request;

  StimGrpcMethodXResponseOp _response;

  StimGrpcMethodXRequestOp get request {
    return _request ??= StimGrpcMethodXRequestOp(this, _pack.methodRequest);
  }

  set request(StimGrpcMethodXRequestOp value) {
    _request = value;
  }
  StimGrpcMethodXResponseOp get response {
    return _response ??= StimGrpcMethodXResponseOp(this, _pack.methodResponse);
  }

  set response(StimGrpcMethodXResponseOp value) {
    _response = value;
  }
  StimGrpcMethodSet(this._pack, List<StimGrpcMethod> items):
      super(_pack._method, items);
}


abstract class StimGrpcMethodScope extends StimScope<StimGrpcMethod, StimGrpcMethodSet> {
  StimGrpcMethodSymbols get s;

  StimGrpcMethod of(name, {dynamic request, dynamic response});
}


class _StimGrpcMethodScopeImpl extends StimScopeImpl<StimGrpcMethod, StimGrpcMethodSet> implements StimGrpcMethodScope {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMethodSymbols _s;

  StimGrpcMethodRequest request;

  StimGrpcMethodResponse response;

  @override
  StimGrpcMethodSymbols get s {
    return _s ??= StimGrpcMethodSymbols(this);
  }
  _StimGrpcMethodScopeImpl(this._pack):
      super();


  @override
  StimGrpcMethod of(name, {dynamic request, dynamic response}) {
    return createAndClear(name)
        ..request += request ?? _pack.methodRequest.none;

        ..response += response ?? _pack.methodResponse.none;
  }

  @override
  void clear(StimGrpcMethod symbol) {
    symbol
        ..request = _pack.methodRequest.none;

        ..response = _pack.methodResponse.none;
  }

  @override
  StimGrpcMethod create() {
    return StimGrpcMethod(this);
  }

  @override
  StimGrpcMethodSet createSet(List<StimGrpcMethod> items) {
    return StimGrpcMethodSet(_pack, items);
  }
}

        
class StimGrpcMethodSymbols {
  final _StimGrpcMethodScopeImpl _scope;
  /// All symbols
  StimGrpcMethodSet all;

  
  StimGrpcMethodSymbols(this._scope) {
    final _s = stimpack.grpc.method;
    all = _s.noneSet;

  }
}

