part of g3.stimpack.model;

class _StimField_KindOp extends StimSymbolOpImpl<StimMetaField, _StimFieldSet,
    StimValue, _StimValueSet> {
  _StimField_KindOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimValue, _StimValueSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimValue value) {
    child.kind = value;
  }
}
