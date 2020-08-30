part of g3.stimpack.rest_api.generated;



class StimRestApiModelApiXRequiredOp extends StimSymbolOpImpl<StimRestApiModelApi, StimRestApiModelApiSet, StimRbacAccessGrant, StimRbacAccessGrantSet> {
  StimRestApiModelApiXRequiredOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimRbacAccessGrantScope scope):
      super(symbols, scope);


  @override
  void onSet(StimRestApiModelApi child, StimRbacAccessGrant values) {
    child.required = values;
  }
}
