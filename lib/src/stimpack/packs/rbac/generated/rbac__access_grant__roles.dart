part of g3.stimpack.rbac.generated;

class StimRbacAccessGrantXRolesSetOp extends StimSymbolSetOpImpl<
    StimRbacAccessGrant,
    StimRbacAccessGrantSet,
    StimRbacAccessRole,
    StimRbacAccessRoleSet> {
  StimRbacAccessGrantXRolesSetOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimRbacAccessRoleScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRbacAccessGrant child, StimRbacAccessRoleSet values) {
    child.roles = values;
  }

  @override
  void onAdd(StimRbacAccessGrant child, StimRbacAccessRoleSet values) {
    child.roles += values;
  }
}
