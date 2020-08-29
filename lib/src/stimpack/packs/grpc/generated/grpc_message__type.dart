part of g3.stimpack.grpc.generated;

    
class StimGrpcMessageXTypeSetOp extends StimSymbolOpImpl<StimGrpcMessage, StimGrpcMessageSet, StimNullType, StimGrpcTypeSet> {
  StimGrpcMessageXTypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimNullType, StimGrpcTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimGrpcMessage child, StimNullType value) {
    child.type = value;
  }
}
    