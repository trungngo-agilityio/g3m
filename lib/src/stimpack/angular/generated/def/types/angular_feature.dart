part of g3.stimpack.angular.generated;



class StimAngularFeature extends StimModelSymbol<StimAngularFeature> {
  Set<StimAngularFeature> features;

  StimAngularModule module;

  StimAngularFeature();


  StimAngularFeature ref() {
    return StimAngularFeatureRef()..symbol = this;
  }

  /// Creates a new "feature" of [StimAngularFeature] type.
  StimAngularFeature refWith({dynamic name, Set<StimAngularFeature> features, StimAngularModule module, Set<StimModelTag> tags}) {
    final res = ref();
    if (name != null) {
      res.name = StimName.of(name);
    }

    if (features != null) {
      res.features = features;
    }

    if (module != null) {
      res.module = module;
    }

    if (tags != null) {
      res.tags = tags;
    }

    return res;
  }
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
