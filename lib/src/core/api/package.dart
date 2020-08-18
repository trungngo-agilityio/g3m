part of g3m.core.dep


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
      i._dependencies = value;
    }
  }
  Dependency _subDep;


  Dependency get subDep {
    return _subDep;
  }

   set subDep(Dependency value) {
    _subDep = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._subDep = value;
    }
  }
  Author _authors;


  Author get authors {
    return _authors;
  }

   set authors(Author value) {
    _authors = value;
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._authors = value;
    }
  }
}


class PackageScope extends Scope<Package> {
  final DependencyScope dependencies;

  final DependencyScope subDep;

  final AuthorScope authors;

  PackageScope(this.dependencies, this.subDep, this.authors);


  @override
  Package make() {
    return Package(this)
        ..dependencies = dependencies.none
        ..subDep = subDep.none
        ..authors = authors.none;
  }

  Package call(Dependency dependencies, Dependency subDep, Author authors) {
    return add(this)
        ..dependencies = dependencies
        ..subDep = subDep
        ..authors = authors;
  }
}
