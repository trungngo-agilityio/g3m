part of g3.stimpack.meta.generated;

class StimMetaPackXTypesSetOp extends StimSymbolSetOpImpl<StimMetaPack,
    StimMetaPackSet, StimMetaType, StimMetaTypeSet> {
  StimMetaPackXTypesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaType, StimMetaTypeSet> scope)
      : super(symbols, scope);

  @override
  void onAdd(StimMetaPack child, StimMetaTypeSet values) {
    child.types += values;
  }

  @override
  void onSet(StimMetaPack child, StimMetaTypeSet values) {
    child.types = values;
  }
}
