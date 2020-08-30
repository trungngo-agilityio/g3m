part of g3.stimpack.rest_api.generated;



class StimRestApiPackageXModelApisSetOp extends StimSymbolSetOpImpl<StimRestApiPackage, StimRestApiPackageSet, StimRestApiModelApi, StimRestApiModelApiSet> {
  StimRestApiPackageXModelApisSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimRestApiModelApiScope scope):
      super(symbols, scope);


  @override
  void onSet(StimRestApiPackage child, StimRestApiModelApiSet values) {
    child.modelApis = values;
  }

  @override
  void onAdd(StimRestApiPackage child, StimRestApiModelApiSet values) {
    child.modelApis += values;
  }
}
