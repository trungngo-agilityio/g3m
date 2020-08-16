part of g3m.core.dep;



class Dependency extends Expr<Dependency> {
  @override
  final DependencyScope scope;

  Dependency(this.scope):
      super(scope);

  Dependency _version;


  Dependency get version {
    return _version;
  }

   set version(Dependency value) {
    _version = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._version = value;
    };
  }
}


class DependencyScope extends Scope<Dependency> {
  final DependencyScope version;

  DependencyScope(this.version);


  @override
  Dependency make() {
    return Dependency(this)
        ..version = version.none;
  }

  Dependency call(Dependency version) {
    return add(this)
        ..version = version;
  }
}
