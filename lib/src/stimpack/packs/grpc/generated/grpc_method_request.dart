part of g3.stimpack.grpc.generated;



class StimGrpcMethodRequest extends StimSymbol<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  StimGrpcMethodRequest(_StimGrpcMethodRequestScopeImpl scope):
      super(scope);


  @override
  StimGrpcMethodRequest clone() {
    return super.clone();
  }
}


class StimGrpcMethodRequestSet extends StimSymbolSet<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMethodRequestSet(this._pack, List<StimGrpcMethodRequest> items):
      super(_pack._methodRequest, items);
}


abstract class StimGrpcMethodRequestScope extends StimScope<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  StimGrpcMethodRequestSymbols get s;

  StimGrpcMethodRequest of(name);
}


class _StimGrpcMethodRequestScopeImpl extends StimScopeImpl<StimGrpcMethodRequest, StimGrpcMethodRequestSet> implements StimGrpcMethodRequestScope {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMethodRequestSymbols _s;

  @override
  StimGrpcMethodRequestSymbols get s {
    return _s ??= StimGrpcMethodRequestSymbols(this);
  }
  _StimGrpcMethodRequestScopeImpl(this._pack):
      super();


  @override
  StimGrpcMethodRequest of(name) {
    return createAndClear(name)
  }

  @override
  void clear(StimGrpcMethodRequest symbol) {
    symbol
  }

  @override
  StimGrpcMethodRequest create() {
    return StimGrpcMethodRequest(this);
  }

  @override
  StimGrpcMethodRequestSet createSet(List<StimGrpcMethodRequest> items) {
    return StimGrpcMethodRequestSet(_pack, items);
  }
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

