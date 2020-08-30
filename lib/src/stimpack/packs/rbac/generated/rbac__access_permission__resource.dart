part of g3.stimpack.rbac.generated;



class StimRbacAccessPermissionXResourceOp extends StimSymbolOpImpl<StimRbacAccessPermission, StimRbacAccessPermissionSet, StimRbacResource, StimRbacResourceSet> {
  StimRbacAccessPermissionXResourceOp(StimSymbolSet<StimSymbol, StimSymbolSet> symbols, StimRbacResourceScope scope):
      super(symbols, scope);


  @override
  void onSet(StimRbacAccessPermission child, StimRbacResource values) {
    child.resource = values;
  }
}
