part of g3.stimpack.rest_api.generated;

class StimRestApiModelApiXRequestSetOp extends StimSymbolSetOpImpl<
    StimRestApiModelApi,
    StimRestApiModelApiSet,
    StimModelType,
    StimModelTypeSet> {
  StimRestApiModelApiXRequestSetOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelTypeScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRestApiModelApi child, StimModelTypeSet values) {
    child.request = values;
  }

  @override
  void onAdd(StimRestApiModelApi child, StimModelTypeSet values) {
    child.request += values;
  }
}
