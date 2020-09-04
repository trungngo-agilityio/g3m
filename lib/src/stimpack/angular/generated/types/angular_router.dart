part of g3.stimpack.angular.generated;



class StimAngularRouter extends StimModelSymbol<StimAngularRouter> {
  Set<StimAngularRouter> entries;

  Set<StimAngularRouterRedirect> redirects;

  StimAngularRouterRef _ref;

  StimAngularRouterRef get ref {
    return _ref ??= StimAngularRouterRef();
  }
  StimAngularRouter();
}


class StimAngularRouterRef extends StimSymbolRef<StimAngularRouter> implements StimAngularRouter {

}


class StimAngularRouterScope {
  /// Creates a new "router" of [StimAngularRouter] type.
  StimAngularRouter of({dynamic name, Set<StimAngularRouter> entries, Set<StimAngularRouterRedirect> redirects, Set<StimModelTag> tags}) {
    return StimAngularRouter()
        ..name = StimName.of(name)
        ..entries = entries ?? {}
        ..redirects = redirects ?? {}
        ..tags = tags ?? {};
  }
}
