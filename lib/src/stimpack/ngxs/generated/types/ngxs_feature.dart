part of g3.stimpack.ngxs.generated;



class StimNgxsFeature extends StimModelSymbol<StimNgxsFeature> {
  Set<StimNgxsState> states;

  StimNgxsFeature();


  StimNgxsFeature ref() {
    return StimNgxsFeatureRef()..symbol = this;
  }

  /// Creates a new "feature" of [StimNgxsFeature] type.
  StimNgxsFeature refWith({dynamic name, Set<StimNgxsState> states, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }
    if (states != null) {
      res.states = states;
    }
    if (tags != null) {
      res.tags = tags;
    }
    return res;
  }
}


class StimNgxsFeatureRef extends StimSymbolRef<StimNgxsFeature> implements StimNgxsFeature {

}


class StimNgxsFeatureScope {
  /// Creates a new "feature" of [StimNgxsFeature] type.
  StimNgxsFeature of({dynamic name, Set<StimNgxsState> states, Set<StimModelTag> tags}) {
    return StimNgxsFeature()
        ..name = StimName.of(name)
        ..states = states ?? {}
        ..tags = tags ?? {};
  }
}
