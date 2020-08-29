part of g3.stimpack.grpc.generated;

class StimGrpcPackage extends StimSymbol<StimGrpcPackage, StimGrpcPackageSet > {
StimGrpcMessage messages;
StimNullService services;

  StimGrpcPackage._(_StimGrpcPackageScopeImpl scope)
      : super(scope);

  @override
  StimGrpcPackage clone() {
    return super.clone()
      ..messages = messages.clone()
      ..services = services.clone();    
  }
}

class StimGrpcPackageSet
    extends StimSymbolSet<StimGrpcPackage, StimGrpcPackageSet> {
  final _StimGrpcGrpcImpl __pack;

  
  StimGrpcPackageSet._(this.__pack, List<StimGrpcPackage> items)
      : super(__pack._package, items);

        
        
  StimGrpcPackageXMessagesSetOp _messages;

  StimGrpcPackageXMessagesSetOp get message =>
      _messages ??= StimGrpcPackageXMessagesSetOp(this, __pack.message);

  set messages(StimGrpcPackageXMessagesSetOp value) => _messages = value;
                
        
  StimGrpcPackageXServicesSetOp _services;

  StimGrpcPackageXServicesSetOp get service =>
      _services ??= StimGrpcPackageXServicesSetOp(this, __pack.service);

  set services(StimGrpcPackageXServicesSetOp value) => _services = value;
        
}

abstract class StimGrpcPackageScope
    extends StimScope<StimGrpcPackage, StimGrpcPackageSet> {
    
  StimGrpcPackageSymbols get s;
    
  StimGrpcPackage of(dynamic name, {dynamic messages, dynamic services});
}


        
class StimGrpcPackageSymbols {
  final _StimGrpcPackageScopeImpl _scope;
  /// All symbols
  StimGrpcPackageSet all;

  
  StimGrpcPackageSymbols(this._scope) {
    final _s = stimpack.grpc.package;
    all = _s.noneSet;

  }
}

class _StimGrpcPackageScopeImpl 
    extends StimScopeImpl<StimGrpcPackage, StimGrpcPackageSet>
    implements StimGrpcPackageScope {
  final _StimGrpcGrpcImpl __pack;
  
  _StimGrpcPackageScopeImpl._(this.__pack) : super();

  StimGrpcPackageSymbols _s;

  @override
  StimGrpcPackageSymbols get s => _s ??= StimGrpcPackageSymbols(this);
  @override
  void clear(StimGrpcPackage symbol) {
    symbol
      ..messages = __pack.message.noneSet
      ..services = __pack.service.noneSet;    
  }

  @override
  StimGrpcPackage create() => StimGrpcPackage._(this);

  @override
  StimGrpcPackage of(dynamic name, {dynamic messages, dynamic services}) {
    return createAndClear(name)
      ..messages += messages ?? __pack.message.noneSet
      ..services += services ?? __pack.service.noneSet;    
  }

  @override
  StimGrpcPackageSet createSet(List<StimGrpcPackage> items) {
    return StimGrpcPackageSet._(__pack, items);
  }
}
    