part of g3.stimpack2.db;

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

  StimDbDatabaseRef _ref;

  /// Gets the reference to this model.
  StimDbDatabase get ref => _ref ??= StimDbDatabaseRef()..symbol = this;

  StimDbDatabase();
}

class StimDbDatabaseRef extends StimSymbolRef<StimDbDatabase>
    implements StimDbDatabase {}
