part of g3.stimpack.angular.generated;



class StimAngularRouterPath extends StimModelSymbol<StimAngularRouterPath> {
  String path;

  StimAngularRouterPath parent;

  Set<StimAngularRouterParam> params;

  StimAngularRouterPath();


  /// Creates a new "routerPath" of [StimAngularRouterPath] type.
  StimAngularRouterPath copyWith({@required
  dynamic name, String path, StimAngularRouterPath parent, Set<StimAngularRouterParam> params, Set<StimModelTag> tags}) {
    return StimAngularRouterPath()
        ..name = StimName.of(name ?? this.name)
        ..path = path ?? this.path
        ..parent = parent ?? this.parent
        ..params = params ?? this.params
        ..tags = tags ?? this.tags;
  }
}


class StimAngularRouterPathScope {
  /// Creates a new "routerPath" of [StimAngularRouterPath] type.
  StimAngularRouterPath of({@required
  dynamic name, String path, StimAngularRouterPath parent, Set<StimAngularRouterParam> params, Set<StimModelTag> tags}) {
    return StimAngularRouterPath()
        ..name = StimName.of(name)
        ..path = path
        ..parent = parent
        ..params = params ?? {}
        ..tags = tags ?? {};
  }
}
