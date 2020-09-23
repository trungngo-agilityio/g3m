part of g3.stimpack.db;

class StimDbDatabaseScope {
  StimDbDatabase of({
    @required dynamic name,
    Set<StimDbTable> tables,
    Set<StimModelTag> tags,
  }) =>
      StimDbDatabase()
        ..name = StimName.of(name)
        ..tables = tables
        ..tags = tags;
}

class StimDbDatabase extends StimModelSymbol<StimDbDatabase> {
  Set<StimDbTable> tables;

  StimDbDatabase();
}
