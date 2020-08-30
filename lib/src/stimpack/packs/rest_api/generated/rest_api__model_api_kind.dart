part of g3.stimpack.rest_api.generated;



class StimRestApiModelApiKind extends StimSymbol<StimRestApiModelApiKind, StimRestApiModelApiKindSet> {
  StimRestApiModelApiKind(_StimRestApiModelApiKindScopeImpl scope):
      super(scope);


  @override
  StimRestApiModelApiKind clone() {
    return super.clone();
  }
}


class StimRestApiModelApiKindSet extends StimSymbolSet<StimRestApiModelApiKind, StimRestApiModelApiKindSet> {
  final _StimRestApiModelApiKindScopeImpl _scope;

  StimRestApiModelApiKindSet(this._scope, List<StimRestApiModelApiKind> items):
      super(_scope, items);
}


abstract class StimRestApiModelApiKindScope extends StimScope<StimRestApiModelApiKind, StimRestApiModelApiKindSet> {
  StimRestApiModelApiKind get createOne;
  StimRestApiModelApiKind get updateOne;
  StimRestApiModelApiKind get findOne;
  StimRestApiModelApiKind get deleteOne;
  StimRestApiModelApiKind get find;
  StimRestApiModelApiKind get delete;

  StimRestApiModelApiKind of(name);
}


class _StimRestApiModelApiKindScopeImpl extends StimScopeImpl<StimRestApiModelApiKind, StimRestApiModelApiKindSet> implements StimRestApiModelApiKindScope {
  StimRestApiModelApiKind _createOne;

  StimRestApiModelApiKind _updateOne;

  StimRestApiModelApiKind _findOne;

  StimRestApiModelApiKind _deleteOne;

  StimRestApiModelApiKind _find;

  StimRestApiModelApiKind _delete;

  @override
  StimRestApiModelApiKind get createOne {
    return _createOne ??= of('create one');
  }
  @override
  StimRestApiModelApiKind get updateOne {
    return _updateOne ??= of('update one');
  }
  @override
  StimRestApiModelApiKind get findOne {
    return _findOne ??= of('find one');
  }
  @override
  StimRestApiModelApiKind get deleteOne {
    return _deleteOne ??= of('delete one');
  }
  @override
  StimRestApiModelApiKind get find {
    return _find ??= of('find');
  }
  @override
  StimRestApiModelApiKind get delete {
    return _delete ??= of('delete');
  }
  _StimRestApiModelApiKindScopeImpl():
      super();


  @override
  StimRestApiModelApiKind of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimRestApiModelApiKind symbol) {
    symbol;
  }

  @override
  StimRestApiModelApiKind create() {
    return StimRestApiModelApiKind(this);
  }

  @override
  StimRestApiModelApiKindSet createSet(List<StimRestApiModelApiKind> items) {
    return StimRestApiModelApiKindSet(this, items);
  }
}
