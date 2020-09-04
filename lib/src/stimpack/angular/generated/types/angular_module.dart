part of g3.stimpack.angular.generated;



class StimAngularModule extends StimModelSymbol<StimAngularModule> {
  Set<StimAngularService> services;

  Set<StimAngularModel> models;

  Set<StimAngularComponent> entryComponents;

  Set<StimAngularModule> exports;

  StimAngularRouter router;

  StimAngularResolver resolver;

  StimAngularModuleRef _ref;

  StimAngularModuleRef get ref {
    return _ref ??= StimAngularModuleRef();
  }
  StimAngularModule();
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
