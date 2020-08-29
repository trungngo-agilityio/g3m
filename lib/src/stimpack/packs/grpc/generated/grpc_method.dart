part of g3.stimpack.grpc.generated;

class StimGrpcMethod extends StimSymbol<StimGrpcMethod, StimGrpcMethodSet > {
StimGrpcMethodRequest request;
StimGrpcMethodResponse response;

  StimGrpcMethod._(_StimGrpcMethodScopeImpl scope)
      : super(scope);

  @override
  StimGrpcMethod clone() {
    return super.clone()
      ..request = request.clone()
      ..response = response.clone();    
  }
}

class StimGrpcMethodSet
    extends StimSymbolSet<StimGrpcMethod, StimGrpcMethodSet> {
  final _StimGrpcGrpcImpl __pack;

  
  StimGrpcMethodSet._(this.__pack, List<StimGrpcMethod> items)
      : super(__pack._method, items);

         
         
  StimGrpcMethodXRequestSetOp _request;

  StimGrpcMethodXRequestSetOp get request =>
      _request ??= StimGrpcMethodXRequestSetOp(this, __pack.methodRequest);

  set request(StimGrpcMethodXRequestSetOp value) => _request = value;
                 
         
  StimGrpcMethodXResponseSetOp _response;

  StimGrpcMethodXResponseSetOp get response =>
      _response ??= StimGrpcMethodXResponseSetOp(this, __pack.methodResponse);

  set response(StimGrpcMethodXResponseSetOp value) => _response = value;
        
}

abstract class StimGrpcMethodScope
    extends StimScope<StimGrpcMethod, StimGrpcMethodSet> {
    
  StimGrpcMethodSymbols get s;
    
  StimGrpcMethod of(dynamic name, {dynamic request, dynamic response});
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

class _StimGrpcMethodScopeImpl 
    extends StimScopeImpl<StimGrpcMethod, StimGrpcMethodSet>
    implements StimGrpcMethodScope {
  final _StimGrpcGrpcImpl __pack;
  
  _StimGrpcMethodScopeImpl._(this.__pack) : super();

  StimGrpcMethodSymbols _s;

  @override
  StimGrpcMethodSymbols get s => _s ??= StimGrpcMethodSymbols(this);
  @override
  void clear(StimGrpcMethod symbol) {
    symbol
      ..request = __pack.methodRequest.none
      ..response = __pack.methodResponse.none;    
  }

  @override
  StimGrpcMethod create() => StimGrpcMethod._(this);

  @override
  StimGrpcMethod of(dynamic name, {dynamic request, dynamic response}) {
    return createAndClear(name)
      ..request = request ?? __pack.methodRequest.none
      ..response = response ?? __pack.methodResponse.none;    
  }

  @override
  StimGrpcMethodSet createSet(List<StimGrpcMethod> items) {
    return StimGrpcMethodSet._(__pack, items);
  }
}
    