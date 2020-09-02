part of g3.stimpack.rbac.generated;

class StimRbacAccessPermissionXActionOp extends StimSymbolOpImpl<
    StimRbacAccessPermission,
    StimRbacAccessPermissionSet,
    StimRbacAction,
    StimRbacActionSet> {
  StimRbacAccessPermissionXActionOp(
      StimSymbolSet<StimSymbol, StimSymbolSet> symbols,
      StimRbacActionScope scope)
      : super(symbols, scope);

  @override
  void onSet(StimRbacAccessPermission child, StimRbacAction values) {
    child.action = values;
  }
}
