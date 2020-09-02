part of g3.stimpack.grpc.generated;

class StimGrpcPackageXMessagesSetOp extends StimSymbolSetOpImpl<StimGrpcPackage,
    StimGrpcPackageSet, StimGrpcMessage, StimGrpcMessageSet> {
  StimGrpcPackageXMessagesSetOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimGrpcMessageScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimGrpcPackage child, StimGrpcMessageSet values) {
    child.messages = values;
  }

  @override
  void onAdd(StimGrpcPackage child, StimGrpcMessageSet values) {
    child.messages += values;
  }
}
