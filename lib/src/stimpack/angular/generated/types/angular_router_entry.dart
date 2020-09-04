part of g3.stimpack.angular.generated;



class StimAngularRouterEntry extends StimModelSymbol<StimAngularRouterEntry> {
  StimAngularRouterPath path;

  StimAngularComponent component;

  StimAngularResolver resolver;

  Set<StimAngularGuard> guards;

  StimAngularModule lazyModule;

  StimAngularRouterEntryRef _ref;

  StimAngularRouterEntryRef get ref {
    return _ref ??= StimAngularRouterEntryRef();
  }
  StimAngularRouterEntry();
}


class StimAngularRouterEntryRef extends StimSymbolRef<StimAngularRouterEntry> implements StimAngularRouterEntry {

}


class StimAngularRouterEntryScope {
  /// Creates a new "routerEntry" of [StimAngularRouterEntry] type.
  StimAngularRouterEntry of({dynamic name, StimAngularRouterPath path, StimAngularComponent component, StimAngularResolver resolver, Set<StimAngularGuard> guards, StimAngularModule lazyModule, Set<StimModelTag> tags}) {
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
