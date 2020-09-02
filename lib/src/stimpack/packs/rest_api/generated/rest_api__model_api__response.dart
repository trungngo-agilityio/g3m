part of g3.stimpack.rest_api.generated;

class StimRestApiModelApiXResponseSetOp extends StimSymbolSetOpImpl<
    StimRestApiModelApi,
    StimRestApiModelApiSet,
    StimModelField,
    StimModelFieldSet> {
  StimRestApiModelApiXResponseSetOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelFieldScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRestApiModelApi child, StimModelFieldSet values) {
    child.response = values;
  }

  @override
  void onAdd(StimRestApiModelApi child, StimModelFieldSet values) {
    child.response += values;
  }
}
