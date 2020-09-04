part of g3.stimpack.angular.generated;



class StimAngularRouterPath extends StimModelSymbol<StimAngularRouterPath> {
  String path;

  StimAngularRouterPath parent;

  Set<StimAngularRouterParam> params;

  StimAngularRouterPathRef _ref;

  StimAngularRouterPathRef get ref {
    return _ref ??= StimAngularRouterPathRef();
  }
  StimAngularRouterPath();
}


class StimAngularRouterPathRef extends StimSymbolRef<StimAngularRouterPath> implements StimAngularRouterPath {

}


class StimAngularRouterPathScope {
  /// Creates a new "routerPath" of [StimAngularRouterPath] type.
  StimAngularRouterPath of({dynamic name, String path, StimAngularRouterPath parent, Set<StimAngularRouterParam> params, Set<StimModelTag> tags}) {
    return StimAngularRouterPath()
        ..name = StimName.of(name)
        ..path = path
        ..parent = parent
        ..params = params ?? {}
        ..tags = tags ?? {};
  }
}
