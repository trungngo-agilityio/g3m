part of g3.stimpack.rbac.generated;



class StimRbacResource extends StimModelSymbol<StimRbacResource> {
  StimRbacResourceKind kind;

  StimRbacResource parent;

  StimRbacResource();


  /// Creates a new "resource" of [StimRbacResource] type.
  StimRbacResource copyWith({@required
  dynamic name, StimRbacResourceKind kind, StimRbacResource parent, Set<StimModelTag> tags}) {
    return StimRbacResource()
        ..name = StimName.of(name ?? this.name)
        ..kind = kind ?? this.kind
        ..parent = parent ?? this.parent
        ..tags = tags ?? this.tags;
  }
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
