part of g3.stimpack.grpc.generated;

class StimGrpcPackage extends StimSymbol<StimGrpcPackage, StimGrpcPackageSet> {
  StimGrpcMessageSet messages;

  StimGrpcServiceSet services;

  StimGrpcPackage(_StimGrpcPackageScopeImpl scope) : super(scope);

  @override
  StimGrpcPackage clone() {
    return super.clone()
      ..messages = messages.clone()
      ..services = services.clone();
  }
}

class StimGrpcPackageSet
    extends StimSymbolSet<StimGrpcPackage, StimGrpcPackageSet> {
  final _StimGrpcPackageScopeImpl _scope;

  StimGrpcPackageXMessagesSetOp _messages;

  StimGrpcPackageXServicesSetOp _services;

  StimGrpcPackageXMessagesSetOp get messages {
    return _messages ??=
        StimGrpcPackageXMessagesSetOp(this, stimpack.grpc.message);
  }

  set messages(StimGrpcPackageXMessagesSetOp value) {
    _messages = value;
  }

  StimGrpcPackageXServicesSetOp get services {
    return _services ??=
        StimGrpcPackageXServicesSetOp(this, stimpack.grpc.service);
  }

  set services(StimGrpcPackageXServicesSetOp value) {
    _services = value;
  }

  StimGrpcPackageSet(this._scope, List<StimGrpcPackage> items)
      : super(_scope, items);
}

abstract class StimGrpcPackageScope
    extends StimScope<StimGrpcPackage, StimGrpcPackageSet> {
  StimGrpcPackage of(name, {dynamic messages, dynamic services});
}

class _StimGrpcPackageScopeImpl
    extends StimScopeImpl<StimGrpcPackage, StimGrpcPackageSet>
    implements StimGrpcPackageScope {
  StimGrpcMessageSet messages;

  StimGrpcServiceSet services;

  _StimGrpcPackageScopeImpl() : super();

  @override
  StimGrpcPackage of(name, {dynamic messages, dynamic services}) {
    return createAndClear(name)
      ..messages += messages ?? stimpack.grpc.message.noneSet
      ..services += services ?? stimpack.grpc.service.noneSet;
  }

  @override
  void clear(StimGrpcPackage symbol) {
    symbol
      ..messages = stimpack.grpc.message.noneSet
      ..services = stimpack.grpc.service.noneSet;
  }

  @override
  StimGrpcPackage create() {
    return StimGrpcPackage(this);
  }

  @override
  StimGrpcPackageSet createSet(List<StimGrpcPackage> items) {
    return StimGrpcPackageSet(this, items);
  }
}
