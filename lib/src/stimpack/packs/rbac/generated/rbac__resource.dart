part of g3.stimpack.rbac.generated;



class StimRbacResource extends StimSymbol<StimRbacResource, StimRbacResourceSet> {
  StimRbacResource(_StimRbacResourceScopeImpl scope):
      super(scope);


  @override
  StimRbacResource clone() {
    return super.clone();
  }
}


class StimRbacResourceSet extends StimSymbolSet<StimRbacResource, StimRbacResourceSet> {
  final _StimRbacResourceScopeImpl _scope;

  StimRbacResourceSet(this._scope, List<StimRbacResource> items):
      super(_scope, items);
}


abstract class StimRbacResourceScope extends StimScope<StimRbacResource, StimRbacResourceSet> {
  StimRbacResource get database;
  StimRbacResource get table;
  StimRbacResource get feature;

  StimRbacResource of(name);
}


class _StimRbacResourceScopeImpl extends StimScopeImpl<StimRbacResource, StimRbacResourceSet> implements StimRbacResourceScope {
  StimRbacResource _database;

  StimRbacResource _table;

  StimRbacResource _feature;

  @override
  StimRbacResource get database {
    return _database ??= of('database');
  }
  @override
  StimRbacResource get table {
    return _table ??= of('table');
  }
  @override
  StimRbacResource get feature {
    return _feature ??= of('feature');
  }
  _StimRbacResourceScopeImpl():
      super();


  @override
  StimRbacResource of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimRbacResource symbol) {
    symbol;
  }

  @override
  StimRbacResource create() {
    return StimRbacResource(this);
  }

  @override
  StimRbacResourceSet createSet(List<StimRbacResource> items) {
    return StimRbacResourceSet(this, items);
  }
}
