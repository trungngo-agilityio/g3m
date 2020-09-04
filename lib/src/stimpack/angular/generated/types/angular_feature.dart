part of g3.stimpack.angular.generated;



class StimAngularFeature extends StimModelSymbol<StimAngularFeature> {
  Set<StimAngularFeature> features;

  StimAngularModule module;

  StimAngularFeatureRef _ref;

  StimAngularFeatureRef get ref {
    return _ref ??= StimAngularFeatureRef();
  }
  StimAngularFeature();
}


class StimAngularFeatureRef extends StimSymbolRef<StimAngularFeature> implements StimAngularFeature {

}


class StimAngularFeatureScope {
  /// Creates a new "feature" of [StimAngularFeature] type.
  StimAngularFeature of({dynamic name, Set<StimAngularFeature> features, StimAngularModule module, Set<StimModelTag> tags}) {
    return StimAngularFeature()
        ..name = StimName.of(name)
        ..features = features ?? {}
        ..module = module
        ..tags = tags ?? {};
  }
}
