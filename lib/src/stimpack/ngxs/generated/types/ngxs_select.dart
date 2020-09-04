part of g3.stimpack.ngxs.generated;



class StimNgxsSelect extends StimModelSymbol<StimNgxsSelect> {
  StimModelField field;

  StimNgxsSelect();


  StimNgxsSelect ref() {
    return StimNgxsSelectRef()..symbol = this;
  }

  /// Creates a new "select" of [StimNgxsSelect] type.
  StimNgxsSelect refWith({dynamic name, StimModelField field, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (field != null) {
      res.field = field;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}


class StimNgxsSelectRef extends StimSymbolRef<StimNgxsSelect> implements StimNgxsSelect {

}


class StimNgxsSelectScope {
  /// Creates a new "select" of [StimNgxsSelect] type.
  StimNgxsSelect of({dynamic name, StimModelField field, Set<StimModelTag> tags}) {
    return StimNgxsSelect()
        ..name = StimName.of(name)
        ..field = field
        ..tags = tags ?? {};
  }
}
