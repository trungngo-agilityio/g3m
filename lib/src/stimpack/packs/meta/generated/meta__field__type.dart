part of g3.stimpack.meta.generated;

class StimMetaFieldXTypeOp extends StimSymbolOpImpl<StimMetaField,
    StimMetaFieldSet, StimMetaType, StimMetaTypeSet> {
  StimMetaFieldXTypeOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaTypeScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimMetaType values) {
    child.type = values;
  }
}
