part of g3.stimpack.rest_api.generated;

class StimRestApiModelApiXApisSetOp extends StimSymbolSetOpImpl<
    StimRestApiModelApi,
    StimRestApiModelApiSet,
    StimRestApiModelApiKind,
    StimRestApiModelApiKindSet> {
  StimRestApiModelApiXApisSetOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimRestApiModelApiKindScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRestApiModelApi child, StimRestApiModelApiKindSet values) {
    child.apis = values;
  }

  @override
  void onAdd(StimRestApiModelApi child, StimRestApiModelApiKindSet values) {
    child.apis += values;
  }
}
