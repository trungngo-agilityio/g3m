part of g3.stimpack.meta.generated;

class StimMetaValue extends StimSymbol<StimMetaValue, StimMetaValueSet> {
  StimMetaValue._(_StimMetaValueScopeImpl scope) : super(scope);

  @override
  StimMetaValue clone() {
    return super.clone();
  }
}

class StimMetaValueSet extends StimSymbolSet<StimMetaValue, StimMetaValueSet> {
  final _StimMetaMetaImpl __pack;

  StimMetaValueSet._(this.__pack, List<StimMetaValue> items)
      : super(__pack._value, items);
}

abstract class StimMetaValueScope
    extends StimScope<StimMetaValue, StimMetaValueSet> {
  StimMetaValueSymbols get s;

  StimMetaValue of(dynamic name);
}

class StimMetaValueSymbols {
  final _StimMetaValueScopeImpl _scope;

  /// All symbols
  StimMetaValueSet all;

  StimMetaValueSymbols(this._scope) {
    final _s = stimpack.meta.value;
    all = _s.noneSet;
  }
}

class _StimMetaValueScopeImpl
    extends StimScopeImpl<StimMetaValue, StimMetaValueSet>
    implements StimMetaValueScope {
  final _StimMetaMetaImpl __pack;

  _StimMetaValueScopeImpl._(this.__pack) : super();

  StimMetaValueSymbols _s;

  @override
  StimMetaValueSymbols get s => _s ??= StimMetaValueSymbols(this);

  @override
  void clear(StimMetaValue symbol) {}

  @override
  StimMetaValue create() => StimMetaValue._(this);

  @override
  StimMetaValue of(dynamic name) {
    return createAndClear(name);
  }

  @override
  StimMetaValueSet createSet(List<StimMetaValue> items) {
    return StimMetaValueSet._(__pack, items);
  }
}
