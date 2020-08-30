part of g3.stimpack.grpc.generated;



class StimGrpcPackageXRangeSetOp extends StimSymbolSetOpImpl<StimGrpcPackage, StimGrpcPackageSet, StimModelRange, StimModelRangeSet> {
  StimGrpcPackageXRangeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelRangeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcPackage child, StimModelRangeSet values) {
    child.range = values;
  }

  @override
  void onAdd(StimGrpcPackage child, StimModelRangeSet values) {
    child.range += values;
  }
}
