part of g3.stimpack.meta.generated;

class StimMetaFieldXTypeSetOp extends StimSymbolOpImpl<StimMetaField,
    StimMetaFieldSet, StimMetaType, StimMetaTypeSet> {
  StimMetaFieldXTypeSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaType, StimMetaTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimMetaType value) {
    child.type = value;
  }
}
