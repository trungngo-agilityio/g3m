part of g3.stimpack.grpc.generated;



class StimGrpcMethodXResponseOp extends StimSymbolOpImpl<StimGrpcMethod, StimGrpcMethodSet, StimGrpcMethodResponse, StimGrpcMethodResponseSet> {
  StimGrpcMethodXResponseOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimGrpcMethodResponseScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcMethod child, StimGrpcMethodResponse values) {
    child.response = values;
  }
}
