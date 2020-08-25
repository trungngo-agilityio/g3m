part of g3.stimpack.model;

class _StimField_TypeOp extends StimSymbolOpImpl<StimMetaField, _StimFieldSet,
    StimType, _StimTypeSet> {
  _StimField_TypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimType, _StimTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimType value) {
    child.type = value;
  }
}
