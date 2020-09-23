part of g3.stimpack.rbac.generated;



class StimRbacRole extends StimModelSymbol<StimRbacRole> {
  Set<StimRbacRole> roles;

  StimRbacRole();


  /// Creates a new "role" of [StimRbacRole] type.
  StimRbacRole copyWith({@required
  dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimRbacRole()
        ..name = StimName.of(name ?? this.name)
        ..roles = roles ?? this.roles
        ..tags = tags ?? this.tags;
  }
}


class StimRbacRoleScope {
  StimRbacRole superAdmin;

  StimRbacRole admin;

  StimRbacRole user;

  StimRbacRole guest;


  /// Creates a new "role" of [StimRbacRole] type.
  StimRbacRole of({@required
  dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimRbacRole()
        ..name = StimName.of(name)
        ..roles = roles ?? {}
        ..tags = tags ?? {};
  }
}
