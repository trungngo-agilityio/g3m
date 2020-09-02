part of g3.stimpack.rest_api.generated;

class StimRestApiPackageXApisSetOp extends StimSymbolSetOpImpl<
    StimRestApiPackage,
    StimRestApiPackageSet,
    StimRestApiApi,
    StimRestApiApiSet> {
  StimRestApiPackageXApisSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimRestApiApiScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRestApiPackage child, StimRestApiApiSet values) {
    child.apis = values;
  }

  @override
  void onAdd(StimRestApiPackage child, StimRestApiApiSet values) {
    child.apis += values;
  }
}
