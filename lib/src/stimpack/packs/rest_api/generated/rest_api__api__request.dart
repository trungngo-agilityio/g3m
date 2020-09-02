part of g3.stimpack.rest_api.generated;

class StimRestApiApiXRequestSetOp extends StimSymbolSetOpImpl<StimRestApiApi,
    StimRestApiApiSet, StimModelType, StimModelTypeSet> {
  StimRestApiApiXRequestSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelTypeScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRestApiApi child, StimModelTypeSet values) {
    child.request = values;
  }

  @override
  void onAdd(StimRestApiApi child, StimModelTypeSet values) {
    child.request += values;
  }
}
