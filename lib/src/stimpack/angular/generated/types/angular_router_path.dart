part of g3.stimpack.angular.generated;



class StimAngularRouterPath extends StimModelSymbol<StimAngularRouterPath> {
  String path;

  StimAngularRouterPath parent;

  Set<StimAngularRouterParam> params;

  StimAngularRouterPath();


  StimAngularRouterPath ref() {
    return StimAngularRouterPathRef()..symbol = this;
  }

  /// Creates a new "routerPath" of [StimAngularRouterPath] type.
  StimAngularRouterPath refWith({dynamic name, String path, StimAngularRouterPath parent, Set<StimAngularRouterParam> params, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (path != null) {
      res.path = path;
    }
    if (parent != null) {
      res.parent = parent;
    }
    if (params != null) {
      res.params = params;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
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
