part of g3m.core.dep;



class Package extends Expr<Package> {
  @override
  final PackageScope scope;

  Package(this.scope):
      super(scope);

  Dependency _dependencies;


  Dependency get dependencies {
    return _dependencies;
  }

   set dependencies(Dependency value) {
    _dependencies = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._dependencies = value;;
    };
  }
}


class PackageScope extends Scope<Package> {
  @override
  Package make() {
    return Package(this);
  }
}
