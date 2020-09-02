part of g3.stimpack.grpc.generated;

class StimGrpcMethodResponse
    extends StimSymbol<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimGrpcMethodResponse(_StimGrpcMethodResponseScopeImpl scope) : super(scope);

  @override
  StimGrpcMethodResponse clone() {
    return super.clone();
  }
}

class StimGrpcMethodResponseSet
    extends StimSymbolSet<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  final _StimGrpcMethodResponseScopeImpl _scope;

  StimGrpcMethodResponseSet(this._scope, List<StimGrpcMethodResponse> items)
      : super(_scope, items);
}

abstract class StimGrpcMethodResponseScope
    extends StimScope<StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimGrpcMethodResponse of(name);
}

class _StimGrpcMethodResponseScopeImpl
    extends StimScopeImpl<StimGrpcMethodResponse, StimGrpcMethodResponseSet>
    implements StimGrpcMethodResponseScope {
  _StimGrpcMethodResponseScopeImpl() : super();

  @override
  StimGrpcMethodResponse of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimGrpcMethodResponse symbol) {
    symbol;
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
