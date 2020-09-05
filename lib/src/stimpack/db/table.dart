part of g3.stimpack.db;

class StimDbTableScope {
  StimDbTable read, write, list;

  StimDbTable of({
    @required dynamic name,
    StimModelType model,
    Set<StimModelTag> tags,
  }) =>
      StimDbTable()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimDbTable extends StimModelSymbol<StimDbTable> {
  Set<StimModelType> model;

  StimDbTableRef _ref;

  /// Gets the reference to this model.
  StimDbTable get ref => _ref ??= StimDbTableRef()..symbol = this;

  StimDbTable();
}

class StimDbTableRef extends StimSymbolRef<StimDbTable> implements StimDbTable {
}
