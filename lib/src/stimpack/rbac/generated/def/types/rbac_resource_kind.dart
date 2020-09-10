part of g3.stimpack.rbac.generated;



class StimRbacResourceKind extends StimModelSymbol<StimRbacResourceKind> {
  StimRbacResourceKind();


  StimRbacResourceKind ref() {
    return StimRbacResourceKindRef()..symbol = this;
  }

  /// Creates a new "resourceKind" of [StimRbacResourceKind] type.
  StimRbacResourceKind refWith({dynamic name, Set<StimModelTag> tags}) {
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


class StimRbacResourceKindRef extends StimSymbolRef<StimRbacResourceKind> implements StimRbacResourceKind {

}


class StimRbacResourceKindScope {
  StimRbacResourceKind root;


  /// Creates a new "resourceKind" of [StimRbacResourceKind] type.
  StimRbacResourceKind of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimRbacResourceKind()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
