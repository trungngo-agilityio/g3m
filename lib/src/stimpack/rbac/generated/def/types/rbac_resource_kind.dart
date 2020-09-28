part of g3.stimpack.rbac.generated;



class StimRbacResourceKind extends StimModelSymbol<StimRbacResourceKind> {
  StimRbacResourceKind();


  /// Creates a new "resourceKind" of [StimRbacResourceKind] type.
  StimRbacResourceKind copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimRbacResourceKind()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
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
