part of g3.stimpack.ngxs.generated;



class StimNgxsSelect extends StimModelSymbol<StimNgxsSelect> {
  StimModelField field;

  StimNgxsSelect();


  /// Creates a new "select" of [StimNgxsSelect] type.
  StimNgxsSelect copyWith({@required
  dynamic name, StimModelField field, Set<StimModelTag> tags}) {
    return StimNgxsSelect()
        ..name = StimName.of(name ?? this.name)
        ..field = field ?? this.field
        ..tags = tags ?? this.tags;
  }
}


class StimNgxsSelectScope {
  /// Creates a new "select" of [StimNgxsSelect] type.
  StimNgxsSelect of({@required
  dynamic name, StimModelField field, Set<StimModelTag> tags}) {
    return StimNgxsSelect()
        ..name = StimName.of(name)
        ..field = field
        ..tags = tags ?? {};
  }
}
