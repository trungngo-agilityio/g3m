part of g3.stimpack.angular.generated;



class StimAngularRouterEntry extends StimModelSymbol<StimAngularRouterEntry> {
  StimAngularRouterPath path;

  StimAngularComponent component;

  StimAngularResolver resolver;

  Set<StimAngularGuard> guards;

  StimAngularModule lazyModule;

  StimAngularRouterEntry();


  /// Creates a new "routerEntry" of [StimAngularRouterEntry] type.
  StimAngularRouterEntry copyWith({@required
  dynamic name, StimAngularRouterPath path, StimAngularComponent component, StimAngularResolver resolver, Set<StimAngularGuard> guards, StimAngularModule lazyModule, Set<StimModelTag> tags}) {
    return StimAngularRouterEntry()
        ..name = StimName.of(name ?? this.name)
        ..path = path ?? this.path
        ..component = component ?? this.component
        ..resolver = resolver ?? this.resolver
        ..guards = guards ?? this.guards
        ..lazyModule = lazyModule ?? this.lazyModule
        ..tags = tags ?? this.tags;
  }
}


class StimAngularRouterEntryScope {
  /// Creates a new "routerEntry" of [StimAngularRouterEntry] type.
  StimAngularRouterEntry of({@required
  dynamic name, StimAngularRouterPath path, StimAngularComponent component, StimAngularResolver resolver, Set<StimAngularGuard> guards, StimAngularModule lazyModule, Set<StimModelTag> tags}) {
    return StimAngularRouterEntry()
        ..name = StimName.of(name)
        ..path = path
        ..component = component
        ..resolver = resolver
        ..guards = guards ?? {}
        ..lazyModule = lazyModule
        ..tags = tags ?? {};
  }
}
