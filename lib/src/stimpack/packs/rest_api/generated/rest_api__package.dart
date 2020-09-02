part of g3.stimpack.rest_api.generated;

class StimRestApiPackage
    extends StimSymbol<StimRestApiPackage, StimRestApiPackageSet> {
  StimRestApiModelApiSet modelApis;

  StimRestApiApiSet apis;

  StimRestApiPackage(_StimRestApiPackageScopeImpl scope) : super(scope);

  @override
  StimRestApiPackage clone() {
    return super.clone()
      ..modelApis = modelApis.clone()
      ..apis = apis.clone();
  }
}

class StimRestApiPackageSet
    extends StimSymbolSet<StimRestApiPackage, StimRestApiPackageSet> {
  final _StimRestApiPackageScopeImpl _scope;

  StimRestApiPackageXModelApisSetOp _modelApis;

  StimRestApiPackageXApisSetOp _apis;

  StimRestApiPackageXModelApisSetOp get modelApis {
    return _modelApis ??=
        StimRestApiPackageXModelApisSetOp(this, stimpack.restApi.modelApi);
  }

  set modelApis(StimRestApiPackageXModelApisSetOp value) {
    _modelApis = value;
  }

  StimRestApiPackageXApisSetOp get apis {
    return _apis ??= StimRestApiPackageXApisSetOp(this, stimpack.restApi.api);
  }

  set apis(StimRestApiPackageXApisSetOp value) {
    _apis = value;
  }

  StimRestApiPackageSet(this._scope, List<StimRestApiPackage> items)
      : super(_scope, items);
}

abstract class StimRestApiPackageScope
    extends StimScope<StimRestApiPackage, StimRestApiPackageSet> {
  StimRestApiPackage of(name, {dynamic modelApis, dynamic apis});
}

class _StimRestApiPackageScopeImpl
    extends StimScopeImpl<StimRestApiPackage, StimRestApiPackageSet>
    implements StimRestApiPackageScope {
  StimRestApiModelApiSet modelApis;

  StimRestApiApiSet apis;

  _StimRestApiPackageScopeImpl() : super();

  @override
  StimRestApiPackage of(name, {dynamic modelApis, dynamic apis}) {
    return createAndClear(name)
      ..modelApis += modelApis ?? stimpack.restApi.modelApi.noneSet
      ..apis += apis ?? stimpack.restApi.api.noneSet;
  }

  @override
  void clear(StimRestApiPackage symbol) {
    symbol
      ..modelApis = stimpack.restApi.modelApi.noneSet
      ..apis = stimpack.restApi.api.noneSet;
  }

  @override
  StimRestApiPackage create() {
    return StimRestApiPackage(this);
  }

  @override
  StimRestApiPackageSet createSet(List<StimRestApiPackage> items) {
    return StimRestApiPackageSet(this, items);
  }
}
