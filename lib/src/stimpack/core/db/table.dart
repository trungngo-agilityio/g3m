part of g3.stimpack.core;

class DbTable extends Expr<DbTable> {
  @override
  final DbTableScope _scope;

  // ---------------------------------------------------------------------------
  // Engine
  // ---------------------------------------------------------------------------
  DbEngine _engine;

  DbEngine get engine => _engine;

  set engine(DbEngine value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._engine = value;
    }
  }

  // ---------------------------------------------------------------------------
  // Schema
  // ---------------------------------------------------------------------------
  DbSchema _schema;

  DbSchema get schema => _schema;

  set schema(DbSchema value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._schema = value;
    }
  }

  // ---------------------------------------------------------------------------
  // Model
  // ---------------------------------------------------------------------------
  Model _model;

  Model get models => _model ?? _scope._model.none;

  set models(Model value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._model = value;
    }
  }

  // ---------------------------------------------------------------------------
  // Fields
  // ---------------------------------------------------------------------------
  Field _fields;

  Field get fields => _fields;

  set fields(Field value) {
    assert(value != null, 'value is required');
    for (var i in eval()) {
      i._fields = value;
    }
  }

  DbTable(this._scope) : super(_scope);
}

class DbTableScope extends Scope<DbTable> {
  final DbSchemaScope _schema;
  final DbEngineScope _engine;
  final ModelScope _model;
  final FieldScope _field;

  DbTableScope(this._engine, this._schema, this._model, this._field);

  @override
  DbTable make() => DbTable(this)
    ..fields = _field.none
    ..models = _model.none
    ..schema = _schema.none
    ..engine = _engine.none;

  DbTable call(Model model, {DbEngine engine, DbSchema schema}) {
    assert(model != null, 'model is required');

    var res = none;
    for (var i in model.eval()) {
      res += add(i.name)
        .._model += i
        .._engine += engine
        .._schema += schema;
    }

    return res;
  }
}
