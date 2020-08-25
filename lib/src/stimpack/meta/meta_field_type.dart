part of g3.stimpack.meta;

class _StimMetaField_TypeOp extends StimSymbolOpImpl<StimMetaField,
    _StimMetaFieldSet, StimMetaType, _StimMetaTypeSet> {
  _StimMetaField_TypeOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimScope<StimMetaType, _StimMetaTypeSet> scope)
      : super(symbols, scope);

  @override
  void onSet(StimMetaField child, StimMetaType value) {
    child.type = value;
  }
}
