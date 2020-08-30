part of g3.stimpack.rest_api.generated;



class StimRestApiModelApiXModelOp extends StimSymbolOpImpl<StimRestApiModelApi, StimRestApiModelApiSet, StimModelType, StimModelTypeSet> {
  StimRestApiModelApiXModelOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelTypeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimRestApiModelApi child, StimModelType values) {
    child.model = values;
  }
}
