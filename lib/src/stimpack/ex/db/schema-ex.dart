part of g3.stimpack.ex;

class DbSchemaScopeEx extends DbSchemaScope with DbSchemaMixin {
  DbSchemaScopeEx() {
    buildDbSchema(this);
  }
}

mixin DbSchemaMixin {
  DbSchema main;

  void buildDbSchema(DbSchemaScope schema) {
    main = schema('main');
  }
}
