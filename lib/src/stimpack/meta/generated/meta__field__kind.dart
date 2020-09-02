part of g3.stimpack.meta.generated;

class StimMetaFieldXKindOp extends StimSymbolOpImpl<StimMetaField,
    StimMetaFieldSet, StimMetaKind, StimMetaKindSet> {
  StimMetaFieldXKindOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaKindScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimMetaKind values) {
    child.kind = values;
  }
}
