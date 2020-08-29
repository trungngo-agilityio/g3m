part of g3.stimpack.grpc.generated;

    
class StimGrpcMessageXTypeSetOp extends StimSymbolOpImpl<StimGrpcMessage, StimGrpcMessageSet, StimModelType, StimGrpcTypeSet> {
  StimGrpcMessageXTypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimModelType, StimGrpcTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimGrpcMessage child, StimModelType value) {
    child.type = value;
  }
}
    