part of g3.stimpack.meta_new.generated;



class StimMetaNewField extends StimSymbol<StimMetaNewField, StimMetaNewFieldSet> {
  StimMetaNewKind kind;

  StimMetaNewType type;

  StimMetaNewKind kind;

  StimMetaNewType type;

  StimMetaNewField(_StimMetaNewFieldScopeImpl scope):
      super(scope);


  @override
  StimMetaNewField clone() {
    return super.clone()
        ..kind = kind.clone()
        ..type = type.clone()
        ..kind = kind.clone()
        ..type = type.clone();
  }
}


class StimMetaNewFieldSet extends StimSymbolSet<StimMetaNewField, StimMetaNewFieldSet> {
  final _StimMetaNewFieldScopeImpl _scope;

  StimMetaNewFieldXKindOp _kind;

  StimMetaNewFieldXTypeOp _type;

  StimMetaNewFieldXKindOp _kind;

  StimMetaNewFieldXTypeOp _type;

  StimMetaNewFieldXKindOp get kind {
    return _kind ??= StimMetaNewFieldXKindOp(this, stimpack.metaNew.kind);
  }

  set kind(StimMetaNewFieldXKindOp value) {
    _kind = value;
  }
  StimMetaNewFieldXTypeOp get type {
    return _type ??= StimMetaNewFieldXTypeOp(this, stimpack.metaNew.type);
  }

  set type(StimMetaNewFieldXTypeOp value) {
    _type = value;
  }
  StimMetaNewFieldXKindOp get kind {
    return _kind ??= StimMetaNewFieldXKindOp(this, stimpack.metaNew.kind);
  }

  set kind(StimMetaNewFieldXKindOp value) {
    _kind = value;
  }
  StimMetaNewFieldXTypeOp get type {
    return _type ??= StimMetaNewFieldXTypeOp(this, stimpack.metaNew.type);
  }

  set type(StimMetaNewFieldXTypeOp value) {
    _type = value;
  }
  StimMetaNewFieldSet(this._scope, List<StimMetaNewField> items):
      super(_scope, items);
}


abstract class StimMetaNewFieldScope extends StimScope<StimMetaNewField, StimMetaNewFieldSet> {
  StimMetaNewField of(name, {dynamic kind, dynamic type, dynamic kind, dynamic type});
}


class _StimMetaNewFieldScopeImpl extends StimScopeImpl<StimMetaNewField, StimMetaNewFieldSet> implements StimMetaNewFieldScope {
  StimMetaNewKind kind;

  StimMetaNewType type;

  StimMetaNewKind kind;

  StimMetaNewType type;

  _StimMetaNewFieldScopeImpl():
      super();


  @override
  StimMetaNewField of(name, {dynamic kind, dynamic type, dynamic kind, dynamic type}) {
    return createAndClear(name)
        ..kind = kind ?? stimpack.metaNew.kind.none
        ..type = type ?? stimpack.metaNew.type.none
        ..kind = kind ?? stimpack.metaNew.kind.none
        ..type = type ?? stimpack.metaNew.type.none;
  }

  @override
  void clear(StimMetaNewField symbol) {
    symbol
        ..kind = stimpack.metaNew.kind.none
        ..type = stimpack.metaNew.type.none
        ..kind = stimpack.metaNew.kind.none
        ..type = stimpack.metaNew.type.none;
  }

  @override
  StimMetaNewField create() {
    return StimMetaNewField(this);
  }

  @override
  StimMetaNewFieldSet createSet(List<StimMetaNewField> items) {
    return StimMetaNewFieldSet(this, items);
  }
}
