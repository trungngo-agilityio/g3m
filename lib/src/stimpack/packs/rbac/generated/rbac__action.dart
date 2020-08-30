part of g3.stimpack.rbac.generated;



class StimRbacAction extends StimSymbol<StimRbacAction, StimRbacActionSet> {
  StimRbacAction(_StimRbacActionScopeImpl scope):
      super(scope);


  @override
  StimRbacAction clone() {
    return super.clone();
  }
}


class StimRbacActionSet extends StimSymbolSet<StimRbacAction, StimRbacActionSet> {
  final _StimRbacActionScopeImpl _scope;

  StimRbacActionSet(this._scope, List<StimRbacAction> items):
      super(_scope, items);
}


abstract class StimRbacActionScope extends StimScope<StimRbacAction, StimRbacActionSet> {
  StimRbacAction get createOne;
  StimRbacAction get updateOne;
  StimRbacAction get deleteOne;
  StimRbacAction get findOne;
  StimRbacAction get find;
  StimRbacAction get delete;

  StimRbacAction of(name);
}


class _StimRbacActionScopeImpl extends StimScopeImpl<StimRbacAction, StimRbacActionSet> implements StimRbacActionScope {
  StimRbacAction _createOne;

  StimRbacAction _updateOne;

  StimRbacAction _deleteOne;

  StimRbacAction _findOne;

  StimRbacAction _find;

  StimRbacAction _delete;

  @override
  StimRbacAction get createOne {
    return _createOne ??= of('create one');
  }
  @override
  StimRbacAction get updateOne {
    return _updateOne ??= of('update one');
  }
  @override
  StimRbacAction get deleteOne {
    return _deleteOne ??= of('delete one');
  }
  @override
  StimRbacAction get findOne {
    return _findOne ??= of('find one');
  }
  @override
  StimRbacAction get find {
    return _find ??= of('find');
  }
  @override
  StimRbacAction get delete {
    return _delete ??= of('delete');
  }
  _StimRbacActionScopeImpl():
      super();


  @override
  StimRbacAction of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimRbacAction symbol) {
    symbol;
  }

  @override
  StimRbacAction create() {
    return StimRbacAction(this);
  }

  @override
  StimRbacActionSet createSet(List<StimRbacAction> items) {
    return StimRbacActionSet(this, items);
  }
}
