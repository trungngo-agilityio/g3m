part of g3m.stimpack.pacman;



class Dependency extends Expr<Dependency> {
  final PacmanWorld world;

  Dependency(this.world):
      super(world.dependency);

  int _version;

  int get version {
    return _version;
  }

  set version(int value) {
    _version = value;
    for (var  i in eval()) {
      i._version = value;
    }
  }
  String _desc;

  String get desc {
    return _desc;
  }

  set desc(String value) {
    _desc = value;
    for (var  i in eval()) {
      i._desc = value;
    }
  }
  // region custom code of dependency
  /// implement custom code here
  void worldAbc() {}
  // endregion custom code of dependency
}


class DependencyScope extends Scope<Dependency> {
  final PacmanWorld world;

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
  // region custom code of dependency scope
  void hello() {}
  // endregion custom code of dependency scope
}
