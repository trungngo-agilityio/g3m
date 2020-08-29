part of g3.stimpack.grpc.generated;

class StimGrpcServiceXMethodsSetOp extends StimSymbolSetOpImpl<StimGrpcService, StimGrpcServiceSet, StimGrpcMethod, StimGrpcMethodSet> {
  StimGrpcServiceXMethodsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimGrpcMethod, StimGrpcMethodSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimGrpcService child, StimGrpcMethodSet values) {
    child.methods += values;
  }

  @override
  void onSet(StimGrpcService child, StimGrpcMethodSet values) {
    child.methods = values;
  }
}
    