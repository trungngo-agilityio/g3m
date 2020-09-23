part of g3.stimpack.ngxs.generated;



class StimNgxsFeature extends StimModelSymbol<StimNgxsFeature> {
  Set<StimNgxsState> states;

  StimNgxsFeature();


  /// Creates a new "feature" of [StimNgxsFeature] type.
  StimNgxsFeature copyWith({@required
  dynamic name, Set<StimNgxsState> states, Set<StimModelTag> tags}) {
    return StimNgxsFeature()
        ..name = StimName.of(name ?? this.name)
        ..states = states ?? this.states
        ..tags = tags ?? this.tags;
  }
}


class StimNgxsFeatureScope {
  /// Creates a new "feature" of [StimNgxsFeature] type.
  StimNgxsFeature of({@required
  dynamic name, Set<StimNgxsState> states, Set<StimModelTag> tags}) {
    return StimNgxsFeature()
        ..name = StimName.of(name)
        ..states = states ?? {}
        ..tags = tags ?? {};
  }
}
