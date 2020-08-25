part of g3m.stimpack.meta;

class MetaPack extends Expr<MetaPack> {
  final MetaWorld world;

  MetaPack(this.world) : super(world.metaPack);

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
// region custom code of meta pack
  /// implement custom code here
// endregion custom code of meta pack
}

class MetaPackScope extends Scope<MetaPack> {
  final MetaWorld world;

  MetaPackScope(this.world) {
    init(MetaPack(world));
  }

  @override
  MetaPack make() {
    return MetaPack(world)..terms = world.metaTerm.none;
  }

  @override
  void clear(MetaPack expr) {
    expr..terms = world.metaTerm.none;
  }

  MetaPack call(String name, {MetaTerm terms}) {
    return add(name)..terms = terms;
  }
// region custom code of meta pack scope
  /// implement custom code here
// endregion custom code of meta pack scope
}
