part of g3.stimpack.grpc.generated;

class StimGrpcService extends StimSymbol<StimGrpcService, StimGrpcServiceSet > {
StimGrpcMethod methods;

  StimGrpcService._(_StimGrpcServiceScopeImpl scope)
      : super(scope);

  @override
  StimGrpcService clone() {
    return super.clone()
      ..methods = methods.clone();    
  }
}

class StimGrpcServiceSet
    extends StimSymbolSet<StimGrpcService, StimGrpcServiceSet> {
  final _StimGrpcGrpcImpl __pack;

  
  StimGrpcServiceSet._(this.__pack, List<StimGrpcService> items)
      : super(__pack._service, items);

        
        
  StimGrpcServiceXMethodsSetOp _methods;

  StimGrpcServiceXMethodsSetOp get method =>
      _methods ??= StimGrpcServiceXMethodsSetOp(this, __pack.method);

  set methods(StimGrpcServiceXMethodsSetOp value) => _methods = value;
        
}

abstract class StimGrpcServiceScope
    extends StimScope<StimGrpcService, StimGrpcServiceSet> {
    
  StimGrpcServiceSymbols get s;
    
  StimGrpcService of(dynamic name, {dynamic methods});
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

class _StimGrpcServiceScopeImpl 
    extends StimScopeImpl<StimGrpcService, StimGrpcServiceSet>
    implements StimGrpcServiceScope {
  final _StimGrpcGrpcImpl __pack;
  
  _StimGrpcServiceScopeImpl._(this.__pack) : super();

  StimGrpcServiceSymbols _s;

  @override
  StimGrpcServiceSymbols get s => _s ??= StimGrpcServiceSymbols(this);
  @override
  void clear(StimGrpcService symbol) {
    symbol
      ..methods = __pack.method.noneSet;    
  }

  @override
  StimGrpcService create() => StimGrpcService._(this);

  @override
  StimGrpcService of(dynamic name, {dynamic methods}) {
    return createAndClear(name)
      ..methods += methods ?? __pack.method.noneSet;    
  }

  @override
  StimGrpcServiceSet createSet(List<StimGrpcService> items) {
    return StimGrpcServiceSet._(__pack, items);
  }
}
    