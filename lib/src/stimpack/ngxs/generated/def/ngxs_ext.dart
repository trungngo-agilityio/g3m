part of g3.stimpack.ngxs.generated;



class StimNgxsOnStimModelType {
  StimModelType feature;

  StimModelType action;

  StimModelType state;

  StimModelType select;
}



extension StimNgxsOnStimModelTypeExtension on StimModelTypeScope {
  StimNgxsOnStimModelType get ngxs {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimNgxs.stimNgxsInstance().onStimModelType;
  }
}
