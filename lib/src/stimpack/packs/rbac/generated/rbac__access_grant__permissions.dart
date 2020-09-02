part of g3.stimpack.rbac.generated;

class StimRbacAccessGrantXPermissionsSetOp extends StimSymbolSetOpImpl<
    StimRbacAccessGrant,
    StimRbacAccessGrantSet,
    StimRbacAccessPermission,
    StimRbacAccessPermissionSet> {
  StimRbacAccessGrantXPermissionsSetOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimRbacAccessPermissionScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRbacAccessGrant child, StimRbacAccessPermissionSet values) {
    child.permissions = values;
  }

  @override
  void onAdd(StimRbacAccessGrant child, StimRbacAccessPermissionSet values) {
    child.permissions += values;
  }
}
