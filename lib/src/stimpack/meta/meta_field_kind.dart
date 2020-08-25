part of g3.stimpack.meta;

class _StimMetaField_KindOp extends StimSymbolOpImpl<StimMetaField,
    _StimMetaFieldSet, StimMetaKind, _StimMetaKindSet> {
  _StimMetaField_KindOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaKind, _StimMetaKindSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimMetaKind value) {
    child.kind = value;
  }
}
