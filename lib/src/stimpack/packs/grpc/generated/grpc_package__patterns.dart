part of g3.stimpack.grpc.generated;



class StimGrpcPackageXPatternsSetOp extends StimSymbolSetOpImpl<StimGrpcPackage, StimGrpcPackageSet, StimModelPattern, StimModelPatternSet> {
  StimGrpcPackageXPatternsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelPatternScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcPackage child, StimModelPatternSet values) {
    child.patterns = values;
  }

  @override
  void onAdd(StimGrpcPackage child, StimModelPatternSet values) {
    child.patterns += values;
  }
}
