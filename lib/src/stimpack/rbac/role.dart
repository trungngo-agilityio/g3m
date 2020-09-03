part of g3.stimpack.rbac;

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
  StimRbacRoleRef _ref;

  /// Gets the reference to this model.
  StimRbacRole get ref => _ref ??= StimRbacRoleRef()..symbol = this;

  StimRbacRole();
}

class StimRbacRoleRef extends StimSymbolRef<StimRbacRole>
    implements StimRbacRole {}
