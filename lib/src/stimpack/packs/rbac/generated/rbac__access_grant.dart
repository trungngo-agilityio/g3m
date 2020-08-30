part of g3.stimpack.rbac.generated;



class StimRbacAccessGrant extends StimSymbol<StimRbacAccessGrant, StimRbacAccessGrantSet> {
  StimRbacAccessRoleSet roles;

  StimRbacAccessPermissionSet permissions;

  StimRbacAccessGrant(_StimRbacAccessGrantScopeImpl scope):
      super(scope);


  @override
  StimRbacAccessGrant clone() {
    return super.clone()
        ..roles = roles.clone()
        ..permissions = permissions.clone();
  }
}


class StimRbacAccessGrantSet extends StimSymbolSet<StimRbacAccessGrant, StimRbacAccessGrantSet> {
  final _StimRbacAccessGrantScopeImpl _scope;

  StimRbacAccessGrantXRolesSetOp _roles;

  StimRbacAccessGrantXPermissionsSetOp _permissions;

  StimRbacAccessGrantXRolesSetOp get roles {
    return _roles ??= StimRbacAccessGrantXRolesSetOp(this, stimpack.rbac.accessRole);
  }

  set roles(StimRbacAccessGrantXRolesSetOp value) {
    _roles = value;
  }
  StimRbacAccessGrantXPermissionsSetOp get permissions {
    return _permissions ??= StimRbacAccessGrantXPermissionsSetOp(this, stimpack.rbac.accessPermission);
  }

  set permissions(StimRbacAccessGrantXPermissionsSetOp value) {
    _permissions = value;
  }
  StimRbacAccessGrantSet(this._scope, List<StimRbacAccessGrant> items):
      super(_scope, items);
}


abstract class StimRbacAccessGrantScope extends StimScope<StimRbacAccessGrant, StimRbacAccessGrantSet> {
  StimRbacAccessGrant get full;

  StimRbacAccessGrant of(name, {dynamic roles, dynamic permissions});
}


class _StimRbacAccessGrantScopeImpl extends StimScopeImpl<StimRbacAccessGrant, StimRbacAccessGrantSet> implements StimRbacAccessGrantScope {
  StimRbacAccessGrant _full;

  StimRbacAccessRoleSet roles;

  StimRbacAccessPermissionSet permissions;

  @override
  StimRbacAccessGrant get full {
    return _full ??= of('full');
  }
  _StimRbacAccessGrantScopeImpl():
      super();


  @override
  StimRbacAccessGrant of(name, {dynamic roles, dynamic permissions}) {
    return createAndClear(name)
        ..roles += roles ?? stimpack.rbac.accessRole.noneSet
        ..permissions += permissions ?? stimpack.rbac.accessPermission.noneSet;
  }

  @override
  void clear(StimRbacAccessGrant symbol) {
    symbol
        ..roles = stimpack.rbac.accessRole.noneSet
        ..permissions = stimpack.rbac.accessPermission.noneSet;
  }

  @override
  StimRbacAccessGrant create() {
    return StimRbacAccessGrant(this);
  }

  @override
  StimRbacAccessGrantSet createSet(List<StimRbacAccessGrant> items) {
    return StimRbacAccessGrantSet(this, items);
  }
}
