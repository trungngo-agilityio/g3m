part of g3.stimpack.ngxs.generated;



class StimNgxsState extends StimModelSymbol<StimNgxsState> {
  StimModelType model;

  Set<StimNgxsAction> actions;

  Set<StimNgxsSelect> selects;

  StimNgxsState();


  /// Creates a new "state" of [StimNgxsState] type.
  StimNgxsState copyWith({@required
  dynamic name, StimModelType model, Set<StimNgxsAction> actions, Set<StimNgxsSelect> selects, Set<StimModelTag> tags}) {
    return StimNgxsState()
        ..name = StimName.of(name ?? this.name)
        ..model = model ?? this.model
        ..actions = actions ?? this.actions
        ..selects = selects ?? this.selects
        ..tags = tags ?? this.tags;
  }
}


class StimNgxsStateScope {
  /// Creates a new "state" of [StimNgxsState] type.
  StimNgxsState of({@required
  dynamic name, StimModelType model, Set<StimNgxsAction> actions, Set<StimNgxsSelect> selects, Set<StimModelTag> tags}) {
    return StimNgxsState()
        ..name = StimName.of(name)
        ..model = model
        ..actions = actions ?? {}
        ..selects = selects ?? {}
        ..tags = tags ?? {};
  }
}
