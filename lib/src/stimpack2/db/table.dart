part of g3.stimpack2.db;

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

  StimDbTable();
}
