part of g3.stimpack.grpc.generated;

class StimGrpcMessageXTypeOp extends StimSymbolOpImpl<StimGrpcMessage,
    StimGrpcMessageSet, StimModelType, StimModelTypeSet> {
  StimGrpcMessageXTypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelTypeScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimGrpcMessage child, StimModelType values) {
    child.type = values;
  }
}
