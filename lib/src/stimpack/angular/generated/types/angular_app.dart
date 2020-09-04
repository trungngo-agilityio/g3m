part of g3.stimpack.angular.generated;



class StimAngularApp extends StimModelSymbol<StimAngularApp> {
  StimIoDir featureDir;

  Set<StimAngularFeature> features;

  StimAngularAppRef _ref;

  StimAngularAppRef get ref {
    return _ref ??= StimAngularAppRef();
  }
  StimAngularApp();
}


class StimAngularAppRef extends StimSymbolRef<StimAngularApp> implements StimAngularApp {

}


class StimAngularAppScope {
  /// Creates a new "app" of [StimAngularApp] type.
  StimAngularApp of({dynamic name, StimIoDir featureDir, Set<StimAngularFeature> features, Set<StimModelTag> tags}) {
    return StimAngularApp()
        ..name = StimName.of(name)
        ..featureDir = featureDir
        ..features = features ?? {}
        ..tags = tags ?? {};
  }
}
