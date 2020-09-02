part of g3.stimpack.rest_api.generated;

class StimRestApiModelApiXIdFieldOp extends StimSymbolOpImpl<
    StimRestApiModelApi,
    StimRestApiModelApiSet,
    StimModelField,
    StimModelFieldSet> {
  StimRestApiModelApiXIdFieldOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelFieldScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRestApiModelApi child, StimModelField values) {
    child.idField = values;
  }
}
