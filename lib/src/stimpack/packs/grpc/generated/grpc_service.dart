part of g3.stimpack.grpc.generated;



class StimGrpcService extends StimSymbol<StimGrpcService, StimGrpcServiceSet> {
  StimGrpcMethodSet methods;

  StimGrpcService(_StimGrpcServiceScopeImpl scope):
      super(scope);


  @override
  StimGrpcService clone() {
    return super.clone()
        ..methods = methods.clone();
  }
}


class StimGrpcServiceSet extends StimSymbolSet<StimGrpcService, StimGrpcServiceSet> {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcServiceXMethodsSetOp _methods;

  StimGrpcServiceXMethodsSetOp get methods {
    return _methods ??= StimGrpcServiceXMethodsSetOp(this, _pack.method);
  }

  set methods(StimGrpcServiceXMethodsSetOp value) {
    _methods = value;
  }
  StimGrpcServiceSet(this._pack, List<StimGrpcService> items):
      super(_pack._service, items);
}


abstract class StimGrpcServiceScope extends StimScope<StimGrpcService, StimGrpcServiceSet> {
  StimGrpcServiceSymbols get s;

  StimGrpcService of(name, {dynamic methods});
}


class _StimGrpcServiceScopeImpl extends StimScopeImpl<StimGrpcService, StimGrpcServiceSet> implements StimGrpcServiceScope {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcServiceSymbols _s;

  StimGrpcMethodSet methods;

  @override
  StimGrpcServiceSymbols get s {
    return _s ??= StimGrpcServiceSymbols(this);
  }
  _StimGrpcServiceScopeImpl(this._pack):
      super();


  @override
  StimGrpcService of(name, {dynamic methods}) {
    return createAndClear(name)
        ..methods += methods ?? _pack.method.noneSet;
  }

  @override
  void clear(StimGrpcService symbol) {
    symbol
        ..methods = _pack.method.noneSet;
  }

  @override
  StimGrpcService create() {
    return StimGrpcService(this);
  }

  @override
  StimGrpcServiceSet createSet(List<StimGrpcService> items) {
    return StimGrpcServiceSet(_pack, items);
  }
}

        
class StimGrpcServiceSymbols {
  final _StimGrpcServiceScopeImpl _scope;
  /// All symbols
  StimGrpcServiceSet all;

  
  StimGrpcServiceSymbols(this._scope) {
    final _s = stimpack.grpc.service;
    all = _s.noneSet;

  }
}

