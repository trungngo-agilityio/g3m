part of g3.stimpack.ngxs.generated;



class OnStimModelTypeForNgxs {
  StimModelType feature;

  StimModelType action;

  StimModelType state;

  StimModelType select;
}



extension OnStimModelTypeForNgxsExtension on StimModelTypeScope {
  OnStimModelTypeForNgxs get ngxs {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimNgxs.stimNgxsInstance().onStimModelType;
  }
}
