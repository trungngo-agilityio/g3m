part of g3.stimpack.rbac.generated;

class StimRbacAccessRole
    extends StimSymbol<StimRbacAccessRole, StimRbacAccessRoleSet> {
  StimRbacAccessPermissionSet permissions;

  StimRbacAccessRole(_StimRbacAccessRoleScopeImpl scope) : super(scope);

  @override
  StimRbacAccessRole clone() {
    return super.clone()..permissions = permissions.clone();
  }
}

class StimRbacAccessRoleSet
    extends StimSymbolSet<StimRbacAccessRole, StimRbacAccessRoleSet> {
  final _StimRbacAccessRoleScopeImpl _scope;

  StimRbacAccessRoleXPermissionsSetOp _permissions;

  StimRbacAccessRoleXPermissionsSetOp get permissions {
    return _permissions ??= StimRbacAccessRoleXPermissionsSetOp(
        this, stimpack.rbac.accessPermission);
  }

  set permissions(StimRbacAccessRoleXPermissionsSetOp value) {
    _permissions = value;
  }

  StimRbacAccessRoleSet(this._scope, List<StimRbacAccessRole> items)
      : super(_scope, items);
}

abstract class StimRbacAccessRoleScope
    extends StimScope<StimRbacAccessRole, StimRbacAccessRoleSet> {
  StimRbacAccessRole get superAdmin;

  StimRbacAccessRole get admin;

  StimRbacAccessRole get manager;

  StimRbacAccessRole get user;

  StimRbacAccessRole get guest;

  StimRbacAccessRole of(name, {dynamic permissions});
}

class _StimRbacAccessRoleScopeImpl
    extends StimScopeImpl<StimRbacAccessRole, StimRbacAccessRoleSet>
    implements StimRbacAccessRoleScope {
  StimRbacAccessRole _superAdmin;

  StimRbacAccessRole _admin;

  StimRbacAccessRole _manager;

  StimRbacAccessRole _user;

  StimRbacAccessRole _guest;

  StimRbacAccessPermissionSet permissions;

  @override
  StimRbacAccessRole get superAdmin {
    return _superAdmin ??= of('super admin');
  }

  @override
  StimRbacAccessRole get admin {
    return _admin ??= of('admin');
  }

  @override
  StimRbacAccessRole get manager {
    return _manager ??= of('manager');
  }

  @override
  StimRbacAccessRole get user {
    return _user ??= of('user');
  }

  @override
  StimRbacAccessRole get guest {
    return _guest ??= of('guest');
  }

  _StimRbacAccessRoleScopeImpl() : super();

  @override
  StimRbacAccessRole of(name, {dynamic permissions}) {
    return createAndClear(name)
      ..permissions += permissions ?? stimpack.rbac.accessPermission.noneSet;
  }

  @override
  void clear(StimRbacAccessRole symbol) {
    symbol..permissions = stimpack.rbac.accessPermission.noneSet;
  }

  @override
  StimRbacAccessRole create() {
    return StimRbacAccessRole(this);
  }

  @override
  StimRbacAccessRoleSet createSet(List<StimRbacAccessRole> items) {
    return StimRbacAccessRoleSet(this, items);
  }
}
