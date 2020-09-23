part of g3.stimpack.angular.generated;



class StimAngularRouter extends StimModelSymbol<StimAngularRouter> {
  Set<StimAngularRouter> entries;

  Set<StimAngularRouterRedirect> redirects;

  StimAngularRouter();


  /// Creates a new "router" of [StimAngularRouter] type.
  StimAngularRouter copyWith({@required
  dynamic name, Set<StimAngularRouter> entries, Set<StimAngularRouterRedirect> redirects, Set<StimModelTag> tags}) {
    return StimAngularRouter()
        ..name = StimName.of(name ?? this.name)
        ..entries = entries ?? this.entries
        ..redirects = redirects ?? this.redirects
        ..tags = tags ?? this.tags;
  }
}


class StimAngularRouterScope {
  /// Creates a new "router" of [StimAngularRouter] type.
  StimAngularRouter of({@required
  dynamic name, Set<StimAngularRouter> entries, Set<StimAngularRouterRedirect> redirects, Set<StimModelTag> tags}) {
    return StimAngularRouter()
        ..name = StimName.of(name)
        ..entries = entries ?? {}
        ..redirects = redirects ?? {}
        ..tags = tags ?? {};
  }
}
