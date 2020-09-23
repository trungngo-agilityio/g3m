part of g3.stimpack.angular.generated;



class StimAngularRouterRedirect extends StimModelSymbol<StimAngularRouterRedirect> {
  StimAngularRouterPath path;

  StimAngularRouterRedirect();


  /// Creates a new "routerRedirect" of [StimAngularRouterRedirect] type.
  StimAngularRouterRedirect copyWith({@required
  dynamic name, StimAngularRouterPath path, Set<StimModelTag> tags}) {
    return StimAngularRouterRedirect()
        ..name = StimName.of(name ?? this.name)
        ..path = path ?? this.path
        ..tags = tags ?? this.tags;
  }
}


class StimAngularRouterRedirectScope {
  /// Creates a new "routerRedirect" of [StimAngularRouterRedirect] type.
  StimAngularRouterRedirect of({@required
  dynamic name, StimAngularRouterPath path, Set<StimModelTag> tags}) {
    return StimAngularRouterRedirect()
        ..name = StimName.of(name)
        ..path = path
        ..tags = tags ?? {};
  }
}
