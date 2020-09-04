part of g3.stimpack.rbac.generated;



class StimRbacRole extends StimModelSymbol<StimRbacRole> {
  Set<StimRbacRole> roles;

  StimRbacRoleRef _ref;

  StimRbacRoleRef get ref {
    return _ref ??= StimRbacRoleRef();
  }
  StimRbacRole();
}


class StimRbacRoleRef extends StimSymbolRef<StimRbacRole> implements StimRbacRole {

}


class StimRbacRoleScope {
  StimRbacRole superAdmin;

  StimRbacRole admin;

  StimRbacRole user;

  StimRbacRole guest;


  /// Creates a new "role" of [StimRbacRole] type.
  StimRbacRole of({dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    return StimRbacRole()
        ..name = StimName.of(name)
        ..roles = roles ?? {}
        ..tags = tags ?? {};
  }
}
