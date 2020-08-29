part of g3.stimpack.meta.generated;



class StimMetaField extends StimSymbol<StimMetaField, StimMetaFieldSet> {
  StimMetaKind kind;

  StimMetaType type;

  StimMetaField(_StimMetaFieldScopeImpl scope):
      super(scope);


  @override
  StimMetaField clone() {
    return super.clone()
        ..kind = kind.clone()
        ..type = type.clone();
  }
}


class StimMetaFieldSet extends StimSymbolSet<StimMetaField, StimMetaFieldSet> {
  final _StimMetaFieldScopeImpl _scope;

  StimMetaFieldXKindOp _kind;

  StimMetaFieldXTypeOp _type;

  StimMetaFieldXKindOp get kind {
    return _kind ??= StimMetaFieldXKindOp(this, stimpack.meta.kind);
  }

  set kind(StimMetaFieldXKindOp value) {
    _kind = value;
  }
  StimMetaFieldXTypeOp get type {
    return _type ??= StimMetaFieldXTypeOp(this, stimpack.meta.type);
  }

  set type(StimMetaFieldXTypeOp value) {
    _type = value;
  }
  StimMetaFieldSet(this._scope, List<StimMetaField> items):
      super(_scope, items);
}


abstract class StimMetaFieldScope extends StimScope<StimMetaField, StimMetaFieldSet> {
  StimMetaFieldSymbols get s;

  StimMetaField of(name, {dynamic kind, dynamic type});
}


class _StimMetaFieldScopeImpl extends StimScopeImpl<StimMetaField, StimMetaFieldSet> implements StimMetaFieldScope {
  StimMetaFieldSymbols _s;

  StimMetaKind kind;

  StimMetaType type;

  @override
  StimMetaFieldSymbols get s {
    return _s ??= StimMetaFieldSymbols(this);
  }
  _StimMetaFieldScopeImpl():
      super();


  @override
  StimMetaField of(name, {dynamic kind, dynamic type}) {
    return createAndClear(name)
        ..kind = kind ?? stimpack.meta.kind.none
        ..type = type ?? stimpack.meta.type.none;
  }

  @override
  void clear(StimMetaField symbol) {
    symbol
        ..kind = stimpack.meta.kind.none
        ..type = stimpack.meta.type.none;
  }

  @override
  StimMetaField create() {
    return StimMetaField(this);
  }

  @override
  StimMetaFieldSet createSet(List<StimMetaField> items) {
    return StimMetaFieldSet(this, items);
  }
}


class StimMetaFieldSymbols {
  StimMetaFieldSet all;


  StimMetaFieldSymbols(StimMetaFieldScope scope) {
    all = scope.noneSet;
  }
}
