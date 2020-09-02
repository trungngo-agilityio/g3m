part of g3.stimpack.grpc.generated;

class StimGrpcService extends StimSymbol<StimGrpcService, StimGrpcServiceSet> {
  StimGrpcMethodSet methods;

  StimGrpcService(_StimGrpcServiceScopeImpl scope) : super(scope);

  @override
  StimGrpcService clone() {
    return super.clone()..methods = methods.clone();
  }
}

class StimGrpcServiceSet
    extends StimSymbolSet<StimGrpcService, StimGrpcServiceSet> {
  final _StimGrpcServiceScopeImpl _scope;

  StimGrpcServiceXMethodsSetOp _methods;

  StimGrpcServiceXMethodsSetOp get methods {
    return _methods ??=
        StimGrpcServiceXMethodsSetOp(this, stimpack.grpc.method);
  }

  set methods(StimGrpcServiceXMethodsSetOp value) {
    _methods = value;
  }

  StimGrpcServiceSet(this._scope, List<StimGrpcService> items)
      : super(_scope, items);
}

abstract class StimGrpcServiceScope
    extends StimScope<StimGrpcService, StimGrpcServiceSet> {
  StimGrpcService of(name, {dynamic methods});
}

class _StimGrpcServiceScopeImpl
    extends StimScopeImpl<StimGrpcService, StimGrpcServiceSet>
    implements StimGrpcServiceScope {
  StimGrpcMethodSet methods;

  _StimGrpcServiceScopeImpl() : super();

  @override
  StimGrpcService of(name, {dynamic methods}) {
    return createAndClear(name)
      ..methods += methods ?? stimpack.grpc.method.noneSet;
  }

  @override
  void clear(StimGrpcService symbol) {
    symbol..methods = stimpack.grpc.method.noneSet;
  }

  @override
  StimGrpcService create() {
    return StimGrpcService(this);
  }

  @override
  StimGrpcServiceSet createSet(List<StimGrpcService> items) {
    return StimGrpcServiceSet(this, items);
  }
}
