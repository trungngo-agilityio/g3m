part of g3.stimpack.rbac.generated;



class StimRbacResource extends StimModelSymbol<StimRbacResource> {
  StimRbacResourceId id;

  StimRbacResource parent;

  StimRbacResource();


  StimRbacResource ref() {
    return StimRbacResourceRef()..symbol = this;
  }

  /// Creates a new "resource" of [StimRbacResource] type.
  StimRbacResource refWith({dynamic name, StimRbacResourceId id, StimRbacResource parent, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (id != null) {
      res.id = id;
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
  StimRbacResource root;

  StimRbacResource database;

  StimRbacResource dataTable;

  StimRbacResource dataRecord;

  StimRbacResource dataField;

  StimRbacResource service;

  StimRbacResource serviceApi;

  StimRbacResource app;

  StimRbacResource appFeature;


  /// Creates a new "resource" of [StimRbacResource] type.
  StimRbacResource of({dynamic name, StimRbacResourceId id, StimRbacResource parent, Set<StimModelTag> tags}) {
    return StimRbacResource()
        ..name = StimName.of(name)
        ..id = id
        ..parent = parent
        ..tags = tags ?? {};
  }
}
