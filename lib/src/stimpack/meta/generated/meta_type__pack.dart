part of g3.stimpack.meta.generated;

class StimMetaTypeXPackSetOp extends StimSymbolOpImpl<StimMetaType,
    StimMetaTypeSet, StimMetaPack, StimMetaPackSet> {
  StimMetaTypeXPackSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaPack, StimMetaPackSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaType child, StimMetaPack value) {
    child.pack = value;
  }
}
