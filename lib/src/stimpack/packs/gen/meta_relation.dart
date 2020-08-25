part of g3m.stimpack.meta;

class MetaRelation extends Expr<MetaRelation> {
  final MetaWorld world;

  MetaRelation(this.world) : super(world.metaRelation);

  MetaTerm _from;

  MetaTerm get from {
    return _from;
  }

  set from(MetaTerm value) {
    _from = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._from = value;
    }
  }

  MetaTerm _to;

  MetaTerm get to {
    return _to;
  }

  set to(MetaTerm value) {
    _to = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._to = value;
    }
  }

  MetaRelationType _type;

  MetaRelationType get type {
    return _type;
  }

  set type(MetaRelationType value) {
    _type = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._type = value;
    }
  }
// region custom code of meta relation
  /// implement custom code here
// endregion custom code of meta relation
}

class MetaRelationScope extends Scope<MetaRelation> {
  final MetaWorld world;

  MetaRelationScope(this.world) {
    init(MetaRelation(world));
  }

  @override
  MetaRelation make() {
    return MetaRelation(world)
      ..from = world.metaTerm.none
      ..to = world.metaTerm.none
      ..type = world.metaRelationType.none;
  }

  @override
  void clear(MetaRelation expr) {
    expr
      ..from = world.metaTerm.none
      ..to = world.metaTerm.none
      ..type = world.metaRelationType.none;
  }

  MetaRelation call(String name,
      {MetaTerm from, MetaTerm to, MetaRelationType type}) {
    return add(name)
      ..from = from
      ..to = to
      ..type = type;
  }
// region custom code of meta relation scope
  /// implement custom code here
// endregion custom code of meta relation scope
}
