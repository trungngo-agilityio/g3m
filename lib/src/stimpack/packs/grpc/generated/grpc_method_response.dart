part of g3.stimpack.grpc.generated;



class StimGrpcMethodResponse extends StimSymbol<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimGrpcMethodResponse(_StimGrpcMethodResponseScopeImpl scope):
      super(scope);


  @override
  StimGrpcMethodResponse clone() {
    return super.clone();
  }
}


class StimGrpcMethodResponseSet extends StimSymbolSet<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMethodResponseSet(this._pack, List<StimGrpcMethodResponse> items):
      super(_pack._methodResponse, items);
}


abstract class StimGrpcMethodResponseScope extends StimScope<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimGrpcMethodResponseSymbols get s;

  StimGrpcMethodResponse of(name);
}


class _StimGrpcMethodResponseScopeImpl extends StimScopeImpl<StimGrpcMethodResponse, StimGrpcMethodResponseSet> implements StimGrpcMethodResponseScope {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcMethodResponseSymbols _s;

  @override
  StimGrpcMethodResponseSymbols get s {
    return _s ??= StimGrpcMethodResponseSymbols(this);
  }
  _StimGrpcMethodResponseScopeImpl(this._pack):
      super();


  @override
  StimGrpcMethodResponse of(name) {
    return createAndClear(name)
  }

  @override
  void clear(StimGrpcMethodResponse symbol) {
    symbol
  }

  @override
  StimGrpcMethodResponse create() {
    return StimGrpcMethodResponse(this);
  }

  @override
  StimGrpcMethodResponseSet createSet(List<StimGrpcMethodResponse> items) {
    return StimGrpcMethodResponseSet(_pack, items);
  }
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

