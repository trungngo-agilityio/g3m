part of g3.stimpack.io.generated;



class OnStimModelTypeForIo {
  StimModelType file;

  StimModelType fileType;

  StimModelType dir;
}



extension OnStimModelTypeForIoExtension on StimModelTypeScope {
  OnStimModelTypeForIo get io {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimIo.stimIoInstance().onStimModelType;
  }
}
