part of g3m.stimpack.meta;

class MetaTerm extends Expr<MetaTerm> {
  final MetaWorld world;

  MetaTerm(this.world) : super(world.metaTerm);

  MetaTerm _terms;

  MetaTerm get terms {
    return _terms;
  }

  set terms(MetaTerm value) {
    _terms = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._terms = value;
    }
  }

  MetaField _fields;

  MetaField get fields {
    return _fields;
  }

  set fields(MetaField value) {
    _fields = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._fields = value;
    }
  }

  MetaPack _pack;

  MetaPack get pack {
    return _pack;
  }

  set pack(MetaPack value) {
    _pack = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._pack = value;
    }
  }
// region custom code of meta term
  /// implement custom code here
// endregion custom code of meta term
}

class MetaTermScope extends Scope<MetaTerm> {
  final MetaWorld world;

  MetaTermScope(this.world) {
    init(MetaTerm(world));
  }

  @override
  MetaTerm make() {
    return MetaTerm(world)
      ..terms = world.metaTerm.none
      ..fields = world.metaField.none
      ..pack = world.metaPack.none;
  }

  @override
  void clear(MetaTerm expr) {
    expr
      ..terms = world.metaTerm.none
      ..fields = world.metaField.none
      ..pack = world.metaPack.none;
  }

  MetaTerm call(String name,
      {MetaTerm terms, MetaField fields, MetaPack pack}) {
    return add(name)
      ..terms = terms
      ..fields = fields
      ..pack = pack;
  }
// region custom code of meta term scope
  /// implement custom code here
// endregion custom code of meta term scope
}
