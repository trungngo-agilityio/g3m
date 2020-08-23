part of g3.stimpack.ex;

class DbTableScopeEx extends DbTableScope with DbTableScopeMixin {
  final DbEngineScopeEx _engine;
  final DbSchemaScopeEx _schema;
  final ModelScopeEx _model;
  final FieldScopeEx _field;

  DbTableScopeEx(this._engine, this._schema, this._model, this._field)
      : super(_engine, _schema, _model, _field) {
    buildDbTableScope(this, _engine, _schema, _model);
  }
}

mixin DbTableScopeMixin {
  DbTable userProfile;

  void buildDbTableScope(
      DbTableScope t, DbEngineMixin e, DbSchemaMixin s, AuthModelMixin m) {
    userProfile = t(m.userProfile, engine: e.postgres, schema: s.main);
  }
}
