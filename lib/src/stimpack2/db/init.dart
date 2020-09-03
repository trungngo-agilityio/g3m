part of g3.stimpack2.db;

class StimDb extends StimPack {
  final StimModel _model;

  final StimDbDatabaseScope database;
  final StimDbTableScope table;

  StimDbModelType _metaTypes;
  StimModelPackage meta;

  StimDb(this._model)
      : database = StimDbDatabaseScope(),
        table = StimDbTableScope(),
        super('db') {
    final t = _model.type, f = _model.field;
    final xt = _metaTypes = StimDbModelType();

    meta = _model.package.of(name: 'db');
    xt.database = t.of(name: 'database', package: meta, fields: null);
    xt.table = t.of(name: 'database', package: meta, fields: {
      f.of(name: 'tables', type: t.setOf(item: xt.database)),
    });
  }
}

StimDb _db;

extension StimDbExtension on StimpackRoot {
  StimDb get db {
    return _db ??= StimDb(stimpack.model);
  }
}

class StimDbModelType {
  StimModelType table, database;
}

extension StimDbModelTypeExtension on StimModelTypeScope {
  StimDbModelType get db {
    return _db._metaTypes;
  }
}

extension StimDbModelPackageExtension on StimModelPackageScope {
  StimModelPackage get db {
    return _db.meta;
  }
}
