part of g3.stimpack2.rest;

class StimRestPackageScope {
  StimRestPackage of({
    @required dynamic name,
    Set<StimRestApi> apis,
    Set<StimRestCrudApi> crudApis,
    Set<StimModelTag> tags,
  }) =>
      StimRestPackage()
        ..name = StimName.of(name)
        ..apis = apis
        ..crudApis = crudApis
        ..tags = tags;
}

class StimRestPackage extends StimModelSymbol<StimRestPackage> {
  Set<StimRestApi> apis;
  Set<StimRestCrudApi> crudApis;

  StimRestPackage();
}
