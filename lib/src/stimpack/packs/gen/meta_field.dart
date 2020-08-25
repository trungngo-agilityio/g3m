part of g3m.stimpack.meta;

class MetaField extends Expr<MetaField> {
  final MetaWorld world;

  MetaField(this.world) : super(world.metaField);

  MetaType _type;

  MetaType get type {
    return _type;
  }

  set type(MetaType value) {
    _type = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._type = value;
    }
  }

  bool _plural;

  bool get plural {
    return _plural;
  }

  set plural(bool value) {
    _plural = value;
    for (var i in eval()) {
      i._plural = value;
    }
  }
// region custom code of meta field
  /// implement custom code here
// endregion custom code of meta field
}

class MetaFieldScope extends Scope<MetaField> {
  final MetaWorld world;

  MetaFieldScope(this.world) {
    init(MetaField(world));
  }

  @override
  MetaField make() {
    return MetaField(world)..type = world.metaType.none;
  }

  @override
  void clear(MetaField expr) {
    expr..type = world.metaType.none;
  }

  MetaField call(String name, {MetaType type, bool plural}) {
    return add(name)
      ..type = type
      ..plural = plural;
  }
// region custom code of meta field scope
  /// implement custom code here
// endregion custom code of meta field scope
}
