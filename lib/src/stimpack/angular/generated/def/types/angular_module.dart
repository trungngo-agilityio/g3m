part of g3.stimpack.angular.generated;



class StimAngularModule extends StimModelSymbol<StimAngularModule> {
  Set<StimAngularService> services;

  Set<StimAngularModel> models;

  Set<StimAngularComponent> declarations;

  Set<StimAngularComponent> entryComponents;

  Set<StimAngularModule> imports;

  Set<StimAngularModule> exports;

  StimAngularRouter router;

  StimAngularResolver resolver;

  StimAngularModule();


  /// Creates a new "module" of [StimAngularModule] type.
  StimAngularModule copyWith({@required
  dynamic name, Set<StimAngularService> services, Set<StimAngularModel> models, Set<StimAngularComponent> declarations, Set<StimAngularComponent> entryComponents, Set<StimAngularModule> imports, Set<StimAngularModule> exports, StimAngularRouter router, StimAngularResolver resolver, Set<StimModelTag> tags}) {
    return StimAngularModule()
        ..name = StimName.of(name ?? this.name)
        ..services = services ?? this.services
        ..models = models ?? this.models
        ..declarations = declarations ?? this.declarations
        ..entryComponents = entryComponents ?? this.entryComponents
        ..imports = imports ?? this.imports
        ..exports = exports ?? this.exports
        ..router = router ?? this.router
        ..resolver = resolver ?? this.resolver
        ..tags = tags ?? this.tags;
  }
}


class StimAngularModuleScope {
  /// Creates a new "module" of [StimAngularModule] type.
  StimAngularModule of({@required
  dynamic name, Set<StimAngularService> services, Set<StimAngularModel> models, Set<StimAngularComponent> declarations, Set<StimAngularComponent> entryComponents, Set<StimAngularModule> imports, Set<StimAngularModule> exports, StimAngularRouter router, StimAngularResolver resolver, Set<StimModelTag> tags}) {
    return StimAngularModule()
        ..name = StimName.of(name)
        ..services = services ?? {}
        ..models = models ?? {}
        ..declarations = declarations ?? {}
        ..entryComponents = entryComponents ?? {}
        ..imports = imports ?? {}
        ..exports = exports ?? {}
        ..router = router
        ..resolver = resolver
        ..tags = tags ?? {};
  }
}
