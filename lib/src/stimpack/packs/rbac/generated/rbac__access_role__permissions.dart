part of g3.stimpack.rbac.generated;



class StimRbacAccessRoleXPermissionsSetOp extends StimSymbolSetOpImpl<StimRbacAccessRole, StimRbacAccessRoleSet, StimRbacAccessPermission, StimRbacAccessPermissionSet> {
  StimRbacAccessRoleXPermissionsSetOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimRbacAccessPermissionScope scope):
      super(symbols, scope);


  @override
  void onSet(StimRbacAccessRole child, StimRbacAccessPermissionSet values) {
    child.permissions = values;
  }

  @override
  void onAdd(StimRbacAccessRole child, StimRbacAccessPermissionSet values) {
    child.permissions += values;
  }
}
