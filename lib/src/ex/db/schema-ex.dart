part of g3m.ex;

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
