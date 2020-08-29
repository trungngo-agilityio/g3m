part of g3.stimpack.grpc.generated;

    
class StimGrpcMethodXRequestSetOp extends StimSymbolOpImpl<StimGrpcMethod, StimGrpcMethodSet, StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  StimGrpcMethodXRequestSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimGrpcMethodRequest, StimGrpcMethodRequestSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimGrpcMethod child, StimGrpcMethodRequest value) {
    child.request = value;
  }
}
    