part of g3m.stimpack.meta;

class MetaType extends Expr<MetaType> {
  final MetaWorld world;

  MetaType(this.world) : super(world.metaType);

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
// region custom code of meta type
  /// implement custom code here
// endregion custom code of meta type
}

class MetaTypeScope extends Scope<MetaType> {
  final MetaWorld world;

  MetaTypeScope(this.world) {
    init(MetaType(world));
  }

  @override
  MetaType make() {
    return MetaType(world);
  }

  @override
  void clear(MetaType expr) {
    expr;
  }

  MetaType call(String name, {String desc}) {
    return add(name)..desc = desc;
  }
// region custom code of meta type scope
  /// implement custom code here
// endregion custom code of meta type scope
}
