part of g3.stimpack.grpc.generated;

    
class StimGrpcMethodXResponseSetOp extends StimSymbolOpImpl<StimGrpcMethod, StimGrpcMethodSet, StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimGrpcMethodXResponseSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimGrpcMethodResponse, StimGrpcMethodResponseSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimGrpcMethod child, StimGrpcMethodResponse value) {
    child.response = value;
  }
}
    