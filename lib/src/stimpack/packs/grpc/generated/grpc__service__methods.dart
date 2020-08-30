part of g3.stimpack.grpc.generated;



class StimGrpcServiceXMethodsSetOp extends StimSymbolSetOpImpl<StimGrpcService, StimGrpcServiceSet, StimGrpcMethod, StimGrpcMethodSet> {
  StimGrpcServiceXMethodsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimGrpcMethodScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcService child, StimGrpcMethodSet values) {
    child.methods = values;
  }

  @override
  void onAdd(StimGrpcService child, StimGrpcMethodSet values) {
    child.methods += values;
  }
}
