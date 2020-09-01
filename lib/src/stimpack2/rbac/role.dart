part of g3.stimpack2.rbac;

class StimRbacRoleScope {
  StimRbacRole superAdmin, admin, user, guest;

  StimRbacRole of({
    @required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimRbacRole()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimRbacRole extends StimModelSymbol<StimRbacRole> {
  StimRbacRole();
}
