part of g3.stimpack.rbac.generated;



class StimRbacResource extends StimModelSymbol<StimRbacResource> {
  StimRbacResource parent;

  StimRbacResourceRef _ref;

  StimRbacResourceRef get ref {
    return _ref ??= StimRbacResourceRef();
  }
  StimRbacResource();
}


class StimRbacResourceRef extends StimSymbolRef<StimRbacResource> implements StimRbacResource {

}


class StimRbacResourceScope {
  StimRbacResource any;

  StimRbacResource database;

  StimRbacResource table;

  StimRbacResource field;

  StimRbacResource api;

  StimRbacResource app;

  StimRbacResource feature;


  /// Creates a new "resource" of [StimRbacResource] type.
  StimRbacResource of({dynamic name, StimRbacResource parent, Set<StimModelTag> tags}) {
    return StimRbacResource()
        ..name = StimName.of(name)
        ..parent = parent
        ..tags = tags ?? {};
  }
}
