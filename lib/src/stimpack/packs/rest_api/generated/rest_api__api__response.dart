part of g3.stimpack.rest_api.generated;



class StimRestApiApiXResponseSetOp extends StimSymbolSetOpImpl<StimRestApiApi, StimRestApiApiSet, StimModelField, StimModelFieldSet> {
  StimRestApiApiXResponseSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelFieldScope scope):
      super(symbols, scope);


  @override
  void onSet(StimRestApiApi child, StimModelFieldSet values) {
    child.response = values;
  }

  @override
  void onAdd(StimRestApiApi child, StimModelFieldSet values) {
    child.response += values;
  }
}
