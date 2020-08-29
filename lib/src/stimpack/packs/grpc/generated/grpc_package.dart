part of g3.stimpack.grpc.generated;



class StimGrpcPackage extends StimSymbol<StimGrpcPackage, StimGrpcPackageSet> {
  StimGrpcMessageSet messages;

  StimGrpcServiceSet services;

  StimGrpcPackage(_StimGrpcPackageScopeImpl scope):
      super(scope);


  @override
  StimGrpcPackage clone() {
    return super.clone()
        ..messages = messages.clone()
        ..services = services.clone();
  }
}


class StimGrpcPackageSet extends StimSymbolSet<StimGrpcPackage, StimGrpcPackageSet> {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcPackageXMessagesSetOp _messages;

  StimGrpcPackageXServicesSetOp _services;

  StimGrpcPackageXMessagesSetOp get messages {
    return _messages ??= StimGrpcPackageXMessagesSetOp(this, _pack.message);
  }

  set messages(StimGrpcPackageXMessagesSetOp value) {
    _messages = value;
  }
  StimGrpcPackageXServicesSetOp get services {
    return _services ??= StimGrpcPackageXServicesSetOp(this, _pack.service);
  }

  set services(StimGrpcPackageXServicesSetOp value) {
    _services = value;
  }
  StimGrpcPackageSet(this._pack, List<StimGrpcPackage> items):
      super(_pack._package, items);
}


abstract class StimGrpcPackageScope extends StimScope<StimGrpcPackage, StimGrpcPackageSet> {
  StimGrpcPackageSymbols get s;

  StimGrpcPackage of(name, {dynamic messages, dynamic services});
}


class _StimGrpcPackageScopeImpl extends StimScopeImpl<StimGrpcPackage, StimGrpcPackageSet> implements StimGrpcPackageScope {
  final _StimGrpcGrpcImpl _pack;

  StimGrpcPackageSymbols _s;

  StimGrpcMessageSet messages;

  StimGrpcServiceSet services;

  @override
  StimGrpcPackageSymbols get s {
    return _s ??= StimGrpcPackageSymbols(this);
  }
  _StimGrpcPackageScopeImpl(this._pack):
      super();


  @override
  StimGrpcPackage of(name, {dynamic messages, dynamic services}) {
    return createAndClear(name)
        ..messages += messages ?? _pack.message.noneSet;

        ..services += services ?? _pack.service.noneSet;
  }

  @override
  void clear(StimGrpcPackage symbol) {
    symbol
        ..messages = _pack.message.noneSet;

        ..services = _pack.service.noneSet;
  }

  @override
  StimGrpcPackage create() {
    return StimGrpcPackage(this);
  }

  @override
  StimGrpcPackageSet createSet(List<StimGrpcPackage> items) {
    return StimGrpcPackageSet(_pack, items);
  }
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

