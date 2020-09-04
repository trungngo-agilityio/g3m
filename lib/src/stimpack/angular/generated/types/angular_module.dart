part of g3.stimpack.angular.generated;



class StimAngularModule extends StimModelSymbol<StimAngularModule> {
  Set<StimAngularService> services;

  Set<StimAngularModel> models;

  Set<StimAngularComponent> entryComponents;

  Set<StimAngularModule> exports;

  StimAngularRouter router;

  StimAngularResolver resolver;

  StimAngularModule();


  StimAngularModule ref() {
    return StimAngularModuleRef()..symbol = this;
  }

  /// Creates a new "module" of [StimAngularModule] type.
  StimAngularModule refWith({dynamic name, Set<StimAngularService> services, Set<StimAngularModel> models, Set<StimAngularComponent> entryComponents, Set<StimAngularModule> exports, StimAngularRouter router, StimAngularResolver resolver, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (services != null) {
      res.services = services;
    }
    if (models != null) {
      res.models = models;
    }
    if (entryComponents != null) {
      res.entryComponents = entryComponents;
    }
    if (exports != null) {
      res.exports = exports;
    }
    if (router != null) {
      res.router = router;
    }
    if (resolver != null) {
      res.resolver = resolver;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}


class StimAngularModuleRef extends StimSymbolRef<StimAngularModule> implements StimAngularModule {

}


class StimAngularModuleScope {
  /// Creates a new "module" of [StimAngularModule] type.
  StimAngularModule of({dynamic name, Set<StimAngularService> services, Set<StimAngularModel> models, Set<StimAngularComponent> entryComponents, Set<StimAngularModule> exports, StimAngularRouter router, StimAngularResolver resolver, Set<StimModelTag> tags}) {
    return StimAngularModule()
        ..name = StimName.of(name)
        ..services = services ?? {}
        ..models = models ?? {}
        ..entryComponents = entryComponents ?? {}
        ..exports = exports ?? {}
        ..router = router
        ..resolver = resolver
        ..tags = tags ?? {};
  }
}
