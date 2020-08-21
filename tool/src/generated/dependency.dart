part of g3m.tool.generated;



class Dependency extends Expr<Dependency> {
  final ToolWorld world;

  Dependency(this.world):
      super(world.dependency);

  int _version;

  int get version {
    return _version;
  }

  set version(int value) {
    _version = value;
    for (var i in eval()) {
      i._version = value;
    }
  }
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
  // region custom code
  /// implement custom code here

  // endregion custom code
}


class DependencyScope extends Scope<Dependency> {
  final ToolWorld world;

  DependencyScope(this.world);


  @override
  Dependency make() {
    return Dependency(world);
  }

  Dependency call({int version, String desc}) {
    return add(null)
        ..version = version
        ..desc = desc;
  }
}
