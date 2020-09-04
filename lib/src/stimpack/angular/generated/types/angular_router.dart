part of g3.stimpack.angular.generated;

class StimAngularRouter extends StimModelSymbol<StimAngularRouter> {
  Set<StimAngularRouter> entries;

  Set<StimAngularRouterRedirect> redirects;

  StimAngularRouter();

  StimAngularRouter ref() {
    return StimAngularRouterRef()..symbol = this;
  }

  /// Creates a new "router" of [StimAngularRouter] type.
  StimAngularRouter refWith(
      {dynamic name,
      Set<StimAngularRouter> entries,
      Set<StimAngularRouterRedirect> redirects,
      Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (entries != null) {
      res.entries = entries;
    }
    if (redirects != null) {
      res.redirects = redirects;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}

class StimAngularRouterRef extends StimSymbolRef<StimAngularRouter>
    implements StimAngularRouter {}

class StimAngularRouterScope {
  /// Creates a new "router" of [StimAngularRouter] type.
  StimAngularRouter of(
      {dynamic name,
      Set<StimAngularRouter> entries,
      Set<StimAngularRouterRedirect> redirects,
      Set<StimModelTag> tags}) {
    return StimAngularRouter()
      ..name = StimName.of(name)
      ..entries = entries ?? {}
      ..redirects = redirects ?? {}
      ..tags = tags ?? {};
  }
}
