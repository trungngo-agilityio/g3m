part of g3.stimpack.meta_new.generated;



class StimMetaNewValue extends StimSymbol<StimMetaNewValue, StimMetaNewValueSet> {
  StimMetaNewValue(_StimMetaNewValueScopeImpl scope):
      super(scope);


  @override
  StimMetaNewValue clone() {
    return super.clone();
  }
}


class StimMetaNewValueSet extends StimSymbolSet<StimMetaNewValue, StimMetaNewValueSet> {
  final _StimMetaNewValueScopeImpl _scope;

  StimMetaNewValueSet(this._scope, List<StimMetaNewValue> items):
      super(_scope, items);
}


abstract class StimMetaNewValueScope extends StimScope<StimMetaNewValue, StimMetaNewValueSet> {
  StimMetaNewValue of(name);
}


class _StimMetaNewValueScopeImpl extends StimScopeImpl<StimMetaNewValue, StimMetaNewValueSet> implements StimMetaNewValueScope {
  _StimMetaNewValueScopeImpl():
      super();


  @override
  StimMetaNewValue of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimMetaNewValue symbol) {
    symbol;
  }

  @override
  StimMetaNewValue create() {
    return StimMetaNewValue(this);
  }

  @override
  StimMetaNewValueSet createSet(List<StimMetaNewValue> items) {
    return StimMetaNewValueSet(this, items);
  }
}
