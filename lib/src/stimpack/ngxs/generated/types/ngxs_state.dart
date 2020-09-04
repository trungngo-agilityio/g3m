part of g3.stimpack.ngxs.generated;



class StimNgxsState extends StimModelSymbol<StimNgxsState> {
  StimModelType model;

  Set<StimNgxsAction> actions;

  Set<StimNgxsSelect> selects;

  StimNgxsState();


  StimNgxsState ref() {
    return StimNgxsStateRef()..symbol = this;
  }

  /// Creates a new "state" of [StimNgxsState] type.
  StimNgxsState refWith({dynamic name, StimModelType model, Set<StimNgxsAction> actions, Set<StimNgxsSelect> selects, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (model != null) {
      res.model = model;
    }
    if (actions != null) {
      res.actions = actions;
    }
    if (selects != null) {
      res.selects = selects;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}


class StimNgxsStateRef extends StimSymbolRef<StimNgxsState> implements StimNgxsState {

}


class StimNgxsStateScope {
  /// Creates a new "state" of [StimNgxsState] type.
  StimNgxsState of({dynamic name, StimModelType model, Set<StimNgxsAction> actions, Set<StimNgxsSelect> selects, Set<StimModelTag> tags}) {
    return StimNgxsState()
        ..name = StimName.of(name)
        ..model = model
        ..actions = actions ?? {}
        ..selects = selects ?? {}
        ..tags = tags ?? {};
  }
}
