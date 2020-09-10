part of g3.stimpack.rbac.generated;



class StimRbacRole extends StimModelSymbol<StimRbacRole> {
  Set<StimRbacRole> roles;

  StimRbacRole();


  StimRbacRole ref() {
    return StimRbacRoleRef()..symbol = this;
  }

  /// Creates a new "role" of [StimRbacRole] type.
  StimRbacRole refWith({dynamic name, Set<StimRbacRole> roles, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (roles != null) {
      res.roles = roles;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
}


class StimRbacRoleRef extends StimSymbolRef<StimRbacRole> implements StimRbacRole {

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
