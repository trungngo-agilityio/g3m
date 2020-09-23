part of g3.stimpack.angular.generated;



class StimAngularRouterParam extends StimModelSymbol<StimAngularRouterParam> {
  StimAngularRouterParam();


  /// Creates a new "routerParam" of [StimAngularRouterParam] type.
  StimAngularRouterParam copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularRouterParam()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimAngularRouterParamScope {
  /// Creates a new "routerParam" of [StimAngularRouterParam] type.
  StimAngularRouterParam of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimAngularRouterParam()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
