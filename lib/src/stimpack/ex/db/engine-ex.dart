part of g3.stimpack.ex;

class DbEngineScopeEx extends DbEngineScope with DbEngineMixin {
  DbEngineScopeEx() {
    buildCommonDbEngine(this);
  }
}

mixin DbEngineMixin {
  DbEngine mongo, postgres, mysql, redis, firebase;

  void buildCommonDbEngine(DbEngineScope engine) {
    mongo = engine('mongo');
    postgres = engine('postgres');
    mysql = engine('mysql');
    redis = engine('redis');
    firebase = engine('firebase');
  }
}
