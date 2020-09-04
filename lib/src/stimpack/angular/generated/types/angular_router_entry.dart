part of g3.stimpack.angular.generated;

class StimAngularRouterEntry extends StimModelSymbol<StimAngularRouterEntry> {
  StimAngularRouterPath path;

  StimAngularComponent component;

  StimAngularResolver resolver;

  Set<StimAngularGuard> guards;

  StimAngularModule lazyModule;

  StimAngularRouterEntry();

  StimAngularRouterEntry ref() {
    return StimAngularRouterEntryRef()..symbol = this;
  }

  /// Creates a new "routerEntry" of [StimAngularRouterEntry] type.
  StimAngularRouterEntry refWith(
      {dynamic name,
      StimAngularRouterPath path,
      StimAngularComponent component,
      StimAngularResolver resolver,
      Set<StimAngularGuard> guards,
      StimAngularModule lazyModule,
      Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (path != null) {
      res.path = path;
    }
    if (component != null) {
      res.component = component;
    }
    if (resolver != null) {
      res.resolver = resolver;
    }
    if (guards != null) {
      res.guards = guards;
    }
    if (lazyModule != null) {
      res.lazyModule = lazyModule;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimAngularRouterEntryRef extends StimSymbolRef<StimAngularRouterEntry>
    implements StimAngularRouterEntry {}

class StimAngularRouterEntryScope {
  /// Creates a new "routerEntry" of [StimAngularRouterEntry] type.
  StimAngularRouterEntry of(
      {dynamic name,
      StimAngularRouterPath path,
      StimAngularComponent component,
      StimAngularResolver resolver,
      Set<StimAngularGuard> guards,
      StimAngularModule lazyModule,
      Set<StimModelTag> tags}) {
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
