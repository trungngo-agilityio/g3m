part of g3.stimpack.angular.generated;



class StimAngularRouterRedirect extends StimModelSymbol<StimAngularRouterRedirect> {
  StimAngularRouterPath path;

  StimAngularRouterRedirect();


  StimAngularRouterRedirect ref() {
    return StimAngularRouterRedirectRef()..symbol = this;
  }

  /// Creates a new "routerRedirect" of [StimAngularRouterRedirect] type.
  StimAngularRouterRedirect refWith({dynamic name, StimAngularRouterPath path, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (path != null) {
      res.path = path;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
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
