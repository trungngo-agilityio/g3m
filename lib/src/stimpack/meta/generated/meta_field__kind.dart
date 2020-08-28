part of g3.stimpack.meta.generated;

class StimMetaFieldXKindSetOp extends StimSymbolOpImpl<StimMetaField,
    StimMetaFieldSet, StimMetaKind, StimMetaKindSet> {
  StimMetaFieldXKindSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaKind, StimMetaKindSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimMetaKind value) {
    child.kind = value;
  }
}
