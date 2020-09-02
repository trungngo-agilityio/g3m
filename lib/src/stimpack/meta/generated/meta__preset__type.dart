part of g3.stimpack.meta.generated;

class StimMetaPresetXTypeOp extends StimSymbolOpImpl<StimMetaPreset,
    StimMetaPresetSet, StimMetaType, StimMetaTypeSet> {
  StimMetaPresetXTypeOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimMetaTypeScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaPreset child, StimMetaType values) {
    child.type = values;
  }
}
