part of g3.stimpack.angular.generated;



class StimAngularRouterParam extends StimModelSymbol<StimAngularRouterParam> {
  StimAngularRouterParamRef _ref;

  StimAngularRouterParamRef get ref {
    return _ref ??= StimAngularRouterParamRef();
  }
  StimAngularRouterParam();
}


class StimAngularRouterParamRef extends StimSymbolRef<StimAngularRouterParam> implements StimAngularRouterParam {

}


class StimAngularRouterParamScope {
  /// Creates a new "routerParam" of [StimAngularRouterParam] type.
  StimAngularRouterParam of({dynamic name, Set<StimModelTag> tags}) {
    return StimAngularRouterParam()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
