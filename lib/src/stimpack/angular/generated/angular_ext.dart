part of g3.stimpack.angular.generated;

class StimAngularOnStimModelType {
  StimModelType app;

  StimModelType feature;

  StimModelType module;

  StimModelType service;

  StimModelType model;

  StimModelType resolver;

  StimModelType router;

  StimModelType routerPath;

  StimModelType routerParam;

  StimModelType routerEntry;

  StimModelType routerRedirect;

  StimModelType guard;

  StimModelType component;

  StimModelType componentTemplate;

  StimModelType componentStyle;
}

class StimAngularOnStimIoDir {
  StimIoDir repoRoot;

  StimIoDir repoSrc;

  StimIoDir repoAssets;

  StimIoDir repoStyles;

  StimIoDir repoI18n;

  StimIoDir repoApp;
}

extension StimAngularOnStimModelTypeExtension on StimModelTypeScope {
  StimAngularOnStimModelType get angular {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.angular.onStimModelType;
  }
}

extension StimAngularOnStimIoDirExtension on StimIoDirScope {
  StimAngularOnStimIoDir get angular {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.angular.onStimIoDir;
  }
}
