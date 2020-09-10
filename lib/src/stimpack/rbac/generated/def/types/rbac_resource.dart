part of g3.stimpack.rbac.generated;



class StimRbacResource extends StimModelSymbol<StimRbacResource> {
  StimRbacResourceKind kind;

  StimRbacResource parent;

  StimRbacResource();


  StimRbacResource ref() {
    return StimRbacResourceRef()..symbol = this;
  }

  /// Creates a new "resource" of [StimRbacResource] type.
  StimRbacResource refWith({dynamic name, StimRbacResourceKind kind, StimRbacResource parent, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (kind != null) {
      res.kind = kind;
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


  /// Creates a new "resource" of [StimRbacResource] type.
  StimRbacResource of({@required
  dynamic name, StimRbacResourceKind kind, StimRbacResource parent, Set<StimModelTag> tags}) {
    return StimRbacResource()
        ..name = StimName.of(name)
        ..kind = kind
        ..parent = parent
        ..tags = tags ?? {};
  }
}
