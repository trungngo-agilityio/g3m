part of g3.stimpack.rbac.generated;



class StimRbacGroup extends StimModelSymbol<StimRbacGroup> {
  Set<StimRbacGroup> groups;

  Set<StimRbacRole> roles;

  StimRbacGroup();


  /// Creates a new "group" of [StimRbacGroup] type.
  StimRbacGroup copyWith({@required
  dynamic name, Set<StimRbacGroup> groups, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimRbacGroup()
        ..name = StimName.of(name ?? this.name)
        ..groups = groups ?? this.groups
        ..roles = roles ?? this.roles
        ..tags = tags ?? this.tags;
  }
}


class StimRbacGroupScope {
  /// Creates a new "group" of [StimRbacGroup] type.
  StimRbacGroup of({@required
  dynamic name, Set<StimRbacGroup> groups, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimRbacGroup()
        ..name = StimName.of(name)
        ..groups = groups ?? {}
        ..roles = roles ?? {}
        ..tags = tags ?? {};
  }
}
