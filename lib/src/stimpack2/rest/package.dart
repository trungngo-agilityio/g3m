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

  StimRestPackageRef _ref;

  /// Gets the reference to this model.
  StimRestPackage get ref => _ref ??= StimRestPackageRef()..symbol = this;

  StimRestPackage();
}

class StimRestPackageRef extends StimSymbolRef<StimRestPackage>
    implements StimRestPackage {}
