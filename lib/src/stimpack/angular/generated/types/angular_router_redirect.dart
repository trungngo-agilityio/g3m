part of g3.stimpack.angular.generated;



class StimAngularRouterRedirect extends StimModelSymbol<StimAngularRouterRedirect> {
  StimAngularRouterPath path;

  StimAngularRouterRedirectRef _ref;

  StimAngularRouterRedirectRef get ref {
    return _ref ??= StimAngularRouterRedirectRef();
  }
  StimAngularRouterRedirect();
}


class StimAngularRouterRedirectRef extends StimSymbolRef<StimAngularRouterRedirect> implements StimAngularRouterRedirect {

}


class StimAngularRouterRedirectScope {
  /// Creates a new "routerRedirect" of [StimAngularRouterRedirect] type.
  StimAngularRouterRedirect of({dynamic name, StimAngularRouterPath path, Set<StimModelTag> tags}) {
    return StimAngularRouterRedirect()
        ..name = StimName.of(name)
        ..path = path
        ..tags = tags ?? {};
  }
}
