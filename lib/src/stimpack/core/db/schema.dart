part of g3.stimpack.core;

class DbSchema extends Expr<DbSchema> {
  DbSchema(Scope<DbSchema> scope) : super(scope);
}

class DbSchemaScope extends Scope<DbSchema> {
  @override
  DbSchema make() => DbSchema(this);

  DbSchema call(String name) {
    return add(name);
  }
}
