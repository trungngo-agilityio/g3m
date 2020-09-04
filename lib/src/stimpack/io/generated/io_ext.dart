part of g3.stimpack.io.generated;

class StimIoOnStimModelType {
  StimModelType file;

  StimModelType fileType;

  StimModelType dir;
}

extension StimIoOnStimModelTypeExtension on StimModelTypeScope {
  StimIoOnStimModelType get io {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return stimpack.io.onStimModelType;
  }
}
