part of g3.stimpack.grpc.generated;

class StimGrpcMethodRequest extends StimSymbol<StimGrpcMethodRequest, StimGrpcMethodRequestSet > {


  StimGrpcMethodRequest._(_StimGrpcMethodRequestScopeImpl scope)
      : super(scope);

  @override
  StimGrpcMethodRequest clone() {
    return super.clone()
;    
  }
}

class StimGrpcMethodRequestSet
    extends StimSymbolSet<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  final _StimGrpcGrpcImpl __pack;

  
  StimGrpcMethodRequestSet._(this.__pack, List<StimGrpcMethodRequest> items)
      : super(__pack._methodRequest, items);


}

abstract class StimGrpcMethodRequestScope
    extends StimScope<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
    
  StimGrpcMethodRequestSymbols get s;
    
  StimGrpcMethodRequest of(dynamic name);
}


        
class StimGrpcMethodRequestSymbols {
  final _StimGrpcMethodRequestScopeImpl _scope;
  /// All symbols
  StimGrpcMethodRequestSet all;

  
  StimGrpcMethodRequestSymbols(this._scope) {
    final _s = stimpack.grpc.methodRequest;
    all = _s.noneSet;

  }
}

class _StimGrpcMethodRequestScopeImpl 
    extends StimScopeImpl<StimGrpcMethodRequest, StimGrpcMethodRequestSet>
    implements StimGrpcMethodRequestScope {
  final _StimGrpcGrpcImpl __pack;
  
  _StimGrpcMethodRequestScopeImpl._(this.__pack) : super();

  StimGrpcMethodRequestSymbols _s;

  @override
  StimGrpcMethodRequestSymbols get s => _s ??= StimGrpcMethodRequestSymbols(this);
  @override
  void clear(StimGrpcMethodRequest symbol) {
    
  }

  @override
  StimGrpcMethodRequest create() => StimGrpcMethodRequest._(this);

  @override
  StimGrpcMethodRequest of(dynamic name) {
    return createAndClear(name)
;    
  }

  @override
  StimGrpcMethodRequestSet createSet(List<StimGrpcMethodRequest> items) {
    return StimGrpcMethodRequestSet._(__pack, items);
  }
}
    