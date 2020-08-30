part of g3.stimpack.grpc.generated;



class StimGrpcMethodXRequestOp extends StimSymbolOpImpl<StimGrpcMethod, StimGrpcMethodSet, StimGrpcMethodRequest, StimGrpcMethodRequestSet> {
  StimGrpcMethodXRequestOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimGrpcMethodRequestScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethod child, StimGrpcMethodRequest values) {
    child.request = values;
  }
}
