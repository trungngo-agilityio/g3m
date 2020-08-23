part of g3.stimpack.core;

class DbEngine extends Expr<DbEngine> {
  DbEngine(Scope<DbEngine> scope) : super(scope);
}

class DbEngineScope extends Scope<DbEngine> {
  @override
  DbEngine make() => DbEngine(this);

  DbEngine call(String name) {
    return add(name);
  }
}
