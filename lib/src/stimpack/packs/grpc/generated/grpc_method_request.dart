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
  final _StimGrpcMethodRequestScopeImpl _scope;

  StimGrpcMethodRequestSet(this._scope, List<StimGrpcMethodRequest> items):
      super(_scope, items);
}


abstract class StimGrpcMethodRequestScope extends StimScope<StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  StimGrpcMethodRequest of(name);
}


class _StimGrpcMethodRequestScopeImpl extends StimScopeImpl<StimGrpcMethodRequest, StimGrpcMethodRequestSet> implements StimGrpcMethodRequestScope {
  _StimGrpcMethodRequestScopeImpl():
      super();


  @override
  StimGrpcMethodRequest of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimGrpcMethodRequest symbol) {
    symbol;
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
