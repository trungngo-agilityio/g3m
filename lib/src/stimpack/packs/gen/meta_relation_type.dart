part of g3m.stimpack.meta;

class MetaRelationType extends Expr<MetaRelationType> {
  final MetaWorld world;

  MetaRelationType(this.world) : super(world.metaRelationType);

  String _desc;

  String get desc {
    return _desc;
  }

  set desc(String value) {
    _desc = value;
    for (var i in eval()) {
      i._desc = value;
    }
  }
// region custom code of meta relation type
  /// implement custom code here
// endregion custom code of meta relation type
}

class MetaRelationTypeScope extends Scope<MetaRelationType> {
  final MetaWorld world;

  MetaRelationTypeScope(this.world) {
    init(MetaRelationType(world));
  }

  @override
  MetaRelationType make() {
    return MetaRelationType(world);
  }

  @override
  void clear(MetaRelationType expr) {
    expr;
  }

  MetaRelationType call(String name, {String desc}) {
    return add(name)..desc = desc;
  }
// region custom code of meta relation type scope
  /// implement custom code here
// endregion custom code of meta relation type scope
}
