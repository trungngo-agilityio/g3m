part of g3.stimpack.rbac.generated;



class StimRbacAccessPermission extends StimSymbol<StimRbacAccessPermission, StimRbacAccessPermissionSet> {
  StimRbacResource resource;

  StimRbacAction action;

  StimRbacAccessPermission(_StimRbacAccessPermissionScopeImpl scope):
      super(scope);


  @override
  StimRbacAccessPermission clone() {
    return super.clone()
        ..resource = resource.clone()
        ..action = action.clone();
  }
}


class StimRbacAccessPermissionSet extends StimSymbolSet<StimRbacAccessPermission, StimRbacAccessPermissionSet> {
  final _StimRbacAccessPermissionScopeImpl _scope;

  StimRbacAccessPermissionXResourceOp _resource;

  StimRbacAccessPermissionXActionOp _action;

  StimRbacAccessPermissionXResourceOp get resource {
    return _resource ??= StimRbacAccessPermissionXResourceOp(this, stimpack.rbac.resource);
  }

  set resource(StimRbacAccessPermissionXResourceOp value) {
    _resource = value;
  }
  StimRbacAccessPermissionXActionOp get action {
    return _action ??= StimRbacAccessPermissionXActionOp(this, stimpack.rbac.action);
  }

  set action(StimRbacAccessPermissionXActionOp value) {
    _action = value;
  }
  StimRbacAccessPermissionSet(this._scope, List<StimRbacAccessPermission> items):
      super(_scope, items);
}


abstract class StimRbacAccessPermissionScope extends StimScope<StimRbacAccessPermission, StimRbacAccessPermissionSet> {
  StimRbacAccessPermission of(name, {dynamic resource, dynamic action});
}


class _StimRbacAccessPermissionScopeImpl extends StimScopeImpl<StimRbacAccessPermission, StimRbacAccessPermissionSet> implements StimRbacAccessPermissionScope {
  StimRbacResource resource;

  StimRbacAction action;

  _StimRbacAccessPermissionScopeImpl():
      super();


  @override
  StimRbacAccessPermission of(name, {dynamic resource, dynamic action}) {
    return createAndClear(name)
        ..resource = resource ?? stimpack.rbac.resource.none
        ..action = action ?? stimpack.rbac.action.none;
  }

  @override
  void clear(StimRbacAccessPermission symbol) {
    symbol
        ..resource = stimpack.rbac.resource.none
        ..action = stimpack.rbac.action.none;
  }

  @override
  StimRbacAccessPermission create() {
    return StimRbacAccessPermission(this);
  }

  @override
  StimRbacAccessPermissionSet createSet(List<StimRbacAccessPermission> items) {
    return StimRbacAccessPermissionSet(this, items);
  }
}
