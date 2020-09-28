part of g3.stimpack.angular.generated;



class StimAngularFeature extends StimModelSymbol<StimAngularFeature> {
  Set<StimAngularFeature> features;

  StimAngularModule module;

  StimAngularFeature();


  /// Creates a new "feature" of [StimAngularFeature] type.
  StimAngularFeature copyWith({@required
  dynamic name, Set<StimAngularFeature> features, StimAngularModule module, Set<StimModelTag> tags}) {
    return StimAngularFeature()
        ..name = StimName.of(name ?? this.name)
        ..features = features ?? this.features
        ..module = module ?? this.module
        ..tags = tags ?? this.tags;
  }
}


class StimAngularFeatureScope {
  /// Creates a new "feature" of [StimAngularFeature] type.
  StimAngularFeature of({@required
  dynamic name, Set<StimAngularFeature> features, StimAngularModule module, Set<StimModelTag> tags}) {
    return StimAngularFeature()
        ..name = StimName.of(name)
        ..features = features ?? {}
        ..module = module
        ..tags = tags ?? {};
  }
}
