part of g3.stimpack.rbac.generated;



class StimRbacResource extends StimModelSymbol<StimRbacResource> {
  StimRbacResource parent;

  StimRbacResource();


  StimRbacResource ref() {
    return StimRbacResourceRef()..symbol = this;
  }

  /// Creates a new "resource" of [StimRbacResource] type.
  StimRbacResource refWith({dynamic name, StimRbacResource parent, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (parent != null) {
      res.parent = parent;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
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
