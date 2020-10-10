part of g3.stimpack.nx.generated;



class OnStimModelTypeForNx {
  StimModelType workspace;

  StimModelType lib;

  StimModelType app;
}



extension OnStimModelTypeForNxExtension on StimModelTypeScope {
  OnStimModelTypeForNx get nx {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimNx.stimNxInstance().onStimModelType;
  }
}
