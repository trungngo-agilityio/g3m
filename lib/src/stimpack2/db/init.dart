part of g3.stimpack2.db;

StimDb _db;

extension StimDbExtension on Stimpack {
  StimDb get db {
    return _db ??= StimDb();
  }
}

class StimDb extends StimPack {
  final StimDbDatabaseScope database;
  final StimDbTableScope table;

  StimDb()
      : database = StimDbDatabaseScope(),
        table = StimDbTableScope(),
        super('db') {}
}
