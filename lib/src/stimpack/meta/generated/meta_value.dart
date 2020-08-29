part of g3.stimpack.meta.generated;



class StimMetaValue extends StimSymbol<StimMetaValue, StimMetaValueSet> {
  StimMetaValue(_StimMetaValueScopeImpl scope):
      super(scope);


  @override
  StimMetaValue clone() {
    return super.clone();
  }
}


class StimMetaValueSet extends StimSymbolSet<StimMetaValue, StimMetaValueSet> {
  final _StimMetaValueScopeImpl _scope;

  StimMetaValueSet(this._scope, List<StimMetaValue> items):
      super(_scope, items);
}


abstract class StimMetaValueScope extends StimScope<StimMetaValue, StimMetaValueSet> {
  StimMetaValueSymbols get s;

  StimMetaValue of(name);
}


class _StimMetaValueScopeImpl extends StimScopeImpl<StimMetaValue, StimMetaValueSet> implements StimMetaValueScope {
  StimMetaValueSymbols _s;

  @override
  StimMetaValueSymbols get s {
    return _s ??= StimMetaValueSymbols(this);
  }
  _StimMetaValueScopeImpl():
      super();


  @override
  StimMetaValue of(name) {
    return createAndClear(name);
  }

  @override
  void clear(StimMetaValue symbol) {
    symbol;
  }

  @override
  StimMetaValue create() {
    return StimMetaValue(this);
  }

  @override
  StimMetaValueSet createSet(List<StimMetaValue> items) {
    return StimMetaValueSet(this, items);
  }
}


class StimMetaValueSymbols {
  StimMetaValueSet all;


  StimMetaValueSymbols(StimMetaValueScope scope) {
    all = scope.noneSet;
  }
}
