part of g3.stimpack.grpc.generated;



class StimGrpcPackageXServicesSetOp extends StimSymbolSetOpImpl<StimGrpcPackage, StimGrpcPackageSet, StimGrpcService, StimGrpcServiceSet> {
  StimGrpcPackageXServicesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimGrpcServiceScope scope):
      super(symbols, scope);


  @override
  void onSet(StimGrpcPackage child, StimGrpcServiceSet values) {
    child.services = values;
  }

  @override
  void onAdd(StimGrpcPackage child, StimGrpcServiceSet values) {
    child.services += values;
  }
}
