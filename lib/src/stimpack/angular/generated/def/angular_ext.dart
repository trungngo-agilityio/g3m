part of g3.stimpack.angular.generated;



class OnStimModelTypeForAngular {
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


class OnStimIoDirForAngular {
  StimIoDir repoRoot;

  StimIoDir repoSrc;

  StimIoDir repoAssets;

  StimIoDir repoStyles;

  StimIoDir repoI18n;

  StimIoDir repoApp;
}



extension OnStimModelTypeForAngularExtension on StimModelTypeScope {
  OnStimModelTypeForAngular get angular {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimAngular.stimAngularInstance().onStimModelType;
  }
}


extension OnStimIoDirForAngularExtension on StimIoDirScope {
  OnStimIoDirForAngular get angular {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimAngular.stimAngularInstance().onStimIoDir;
  }
}
