part of g3.stimpack.model.generated;



class StimModelPackage extends StimSymbol<StimModelPackage, StimModelPackageSet> {
  StimModelTypeSet types;

  StimModelPackage(_StimModelPackageScopeImpl scope):
      super(scope);


  @override
  StimModelPackage clone() {
    return super.clone()
        ..types = types.clone();
  }
}


class StimModelPackageSet extends StimSymbolSet<StimModelPackage, StimModelPackageSet> {
  final _StimModelPackageScopeImpl _scope;

  StimModelPackageXTypesSetOp _types;

  StimModelPackageXTypesSetOp get types {
    return _types ??= StimModelPackageXTypesSetOp(this, stimpack.model.type);
  }

  set types(StimModelPackageXTypesSetOp value) {
    _types = value;
  }
  StimModelPackageSet(this._scope, List<StimModelPackage> items):
      super(_scope, items);
}


abstract class StimModelPackageScope extends StimScope<StimModelPackage, StimModelPackageSet> {
  StimModelPackage get primitive;

  StimModelPackage of(name, {dynamic types});
}


class _StimModelPackageScopeImpl extends StimScopeImpl<StimModelPackage, StimModelPackageSet> implements StimModelPackageScope {
  StimModelPackage _primitive;

  StimModelTypeSet types;

  @override
  StimModelPackage get primitive {
    return _primitive ??= of('primitive');
  }
  _StimModelPackageScopeImpl():
      super();


  @override
  StimModelPackage of(name, {dynamic types}) {
    return createAndClear(name)
        ..types += types ?? stimpack.model.type.noneSet;
  }

  @override
  void clear(StimModelPackage symbol) {
    symbol
        ..types = stimpack.model.type.noneSet;
  }

  @override
  StimModelPackage create() {
    return StimModelPackage(this);
  }

  @override
  StimModelPackageSet createSet(List<StimModelPackage> items) {
    return StimModelPackageSet(this, items);
  }
}
