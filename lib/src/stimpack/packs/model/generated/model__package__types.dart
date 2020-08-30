part of g3.stimpack.model.generated;



class StimModelPackageXTypesSetOp extends StimSymbolSetOpImpl<StimModelPackage, StimModelPackageSet, StimModelType, StimModelTypeSet> {
  StimModelPackageXTypesSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimModelTypeScope scope):
      super(symbols, scope);


  @override
  void onSet(StimModelPackage child, StimModelTypeSet values) {
    child.types = values;
  }

  @override
  void onAdd(StimModelPackage child, StimModelTypeSet values) {
    child.types += values;
  }
}
