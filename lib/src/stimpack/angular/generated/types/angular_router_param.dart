part of g3.stimpack.angular.generated;



class StimAngularRouterParam extends StimModelSymbol<StimAngularRouterParam> {
  StimAngularRouterParam();


  StimAngularRouterParam ref() {
    return StimAngularRouterParamRef()..symbol = this;
  }

  /// Creates a new "routerParam" of [StimAngularRouterParam] type.
  StimAngularRouterParam refWith({dynamic name, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
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
