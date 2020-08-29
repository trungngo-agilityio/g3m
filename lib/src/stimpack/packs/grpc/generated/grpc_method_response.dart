part of g3.stimpack.grpc.generated;

class StimGrpcMethodResponse extends StimSymbol<StimGrpcMethodResponse, StimGrpcMethodResponseSet > {


  StimGrpcMethodResponse._(_StimGrpcMethodResponseScopeImpl scope)
      : super(scope);

  @override
  StimGrpcMethodResponse clone() {
    return super.clone()
;    
  }
}

class StimGrpcMethodResponseSet
    extends StimSymbolSet<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  final _StimGrpcGrpcImpl __pack;

  
  StimGrpcMethodResponseSet._(this.__pack, List<StimGrpcMethodResponse> items)
      : super(__pack._methodResponse, items);


}

abstract class StimGrpcMethodResponseScope
    extends StimScope<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
    
  StimGrpcMethodResponseSymbols get s;
    
  StimGrpcMethodResponse of(dynamic name);
}


        
class StimGrpcMethodResponseSymbols {
  final _StimGrpcMethodResponseScopeImpl _scope;
  /// All symbols
  StimGrpcMethodResponseSet all;

  
  StimGrpcMethodResponseSymbols(this._scope) {
    final _s = stimpack.grpc.methodResponse;
    all = _s.noneSet;

  }
}

class _StimGrpcMethodResponseScopeImpl 
    extends StimScopeImpl<StimGrpcMethodResponse, StimGrpcMethodResponseSet>
    implements StimGrpcMethodResponseScope {
  final _StimGrpcGrpcImpl __pack;
  
  _StimGrpcMethodResponseScopeImpl._(this.__pack) : super();

  StimGrpcMethodResponseSymbols _s;

  @override
  StimGrpcMethodResponseSymbols get s => _s ??= StimGrpcMethodResponseSymbols(this);
  @override
  void clear(StimGrpcMethodResponse symbol) {
    
  }

  @override
  StimGrpcMethodResponse create() => StimGrpcMethodResponse._(this);

  @override
  StimGrpcMethodResponse of(dynamic name) {
    return createAndClear(name)
;    
  }

  @override
  StimGrpcMethodResponseSet createSet(List<StimGrpcMethodResponse> items) {
    return StimGrpcMethodResponseSet._(__pack, items);
  }
}
    