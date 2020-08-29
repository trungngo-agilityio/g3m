part of g3.stimpack.meta.generated;



class StimMetaPack extends StimSymbol<StimMetaPack, StimMetaPackSet> {
  StimMetaTypeSet types;

  StimMetaPack(_StimMetaPackScopeImpl scope):
      super(scope);


  @override
  StimMetaPack clone() {
    return super.clone()
        ..types = types.clone();
  }
}


class StimMetaPackSet extends StimSymbolSet<StimMetaPack, StimMetaPackSet> {
  final _StimMetaPackScopeImpl _scope;

  StimMetaPackXTypesSetOp _types;

  StimMetaPackXTypesSetOp get types {
    return _types ??= StimMetaPackXTypesSetOp(this, stimpack.meta.type);
  }

  set types(StimMetaPackXTypesSetOp value) {
    _types = value;
  }
  StimMetaPackSet(this._scope, List<StimMetaPack> items):
      super(_scope, items);
}


abstract class StimMetaPackScope extends StimScope<StimMetaPack, StimMetaPackSet> {
  StimMetaPackSymbols get s;

  StimMetaPack of(name, {dynamic types});
}


class _StimMetaPackScopeImpl extends StimScopeImpl<StimMetaPack, StimMetaPackSet> implements StimMetaPackScope {
  StimMetaPackSymbols _s;

  StimMetaTypeSet types;

  @override
  StimMetaPackSymbols get s {
    return _s ??= StimMetaPackSymbols(this);
  }
  _StimMetaPackScopeImpl():
      super();


  @override
  StimMetaPack of(name, {dynamic types}) {
    return createAndClear(name)
        ..types += types ?? stimpack.meta.type.noneSet;
  }

  @override
  void clear(StimMetaPack symbol) {
    symbol
        ..types = stimpack.meta.type.noneSet;
  }

  @override
  StimMetaPack create() {
    return StimMetaPack(this);
  }

  @override
  StimMetaPackSet createSet(List<StimMetaPack> items) {
    return StimMetaPackSet(this, items);
  }
}


class StimMetaPackSymbols {
  StimMetaPackSet all;


  StimMetaPackSymbols(StimMetaPackScope scope) {
    all = scope.noneSet;
  }
}
