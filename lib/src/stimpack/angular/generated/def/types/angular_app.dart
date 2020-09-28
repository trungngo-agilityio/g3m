part of g3.stimpack.angular.generated;



class StimAngularApp extends StimModelSymbol<StimAngularApp> {
  StimIoDir rootDir;

  StimIoDir featureDir;

  Set<StimAngularFeature> features;

  StimAngularApp();


  /// Creates a new "app" of [StimAngularApp] type.
  StimAngularApp copyWith({@required
  dynamic name, StimIoDir rootDir, StimIoDir featureDir, Set<StimAngularFeature> features, Set<StimModelTag> tags}) {
    return StimAngularApp()
        ..name = StimName.of(name ?? this.name)
        ..rootDir = rootDir ?? this.rootDir
        ..featureDir = featureDir ?? this.featureDir
        ..features = features ?? this.features
        ..tags = tags ?? this.tags;
  }
}


class StimAngularAppScope {
  /// Creates a new "app" of [StimAngularApp] type.
  StimAngularApp of({@required
  dynamic name, StimIoDir rootDir, StimIoDir featureDir, Set<StimAngularFeature> features, Set<StimModelTag> tags}) {
    return StimAngularApp()
        ..name = StimName.of(name)
        ..rootDir = rootDir
        ..featureDir = featureDir
        ..features = features ?? {}
        ..tags = tags ?? {};
  }
}
