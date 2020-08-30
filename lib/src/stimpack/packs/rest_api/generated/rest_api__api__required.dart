part of g3.stimpack.rest_api.generated;



class StimRestApiApiXRequiredOp extends StimSymbolOpImpl<StimRestApiApi, StimRestApiApiSet, StimRbacAccessGrant, StimRbacAccessGrantSet> {
  StimRestApiApiXRequiredOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimRbacAccessGrantScope scope):
      super(symbols, scope);


  @override
  void onSet(StimRestApiApi child, StimRbacAccessGrant values) {
    child.required = values;
  }
}
