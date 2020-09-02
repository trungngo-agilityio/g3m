part of g3.stimpack.model.generated;

class StimModelTypeXMixinsSetOp extends StimSymbolSetOpImpl<StimModelType,
    StimModelTypeSet, StimModelType, StimModelTypeSet> {
  StimModelTypeXMixinsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimModelTypeScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimModelType child, StimModelTypeSet values) {
    child.mixins = values;
  }

  @override
  void onAdd(StimModelType child, StimModelTypeSet values) {
    child.mixins += values;
  }
}
