part of g3.stimpack.func.generated;



class OnStimModelTypeForFunc {
  StimModelType map;

  StimModelType fieldMap;

  StimModelType filter;
}



extension OnStimModelTypeForFuncExtension on StimModelTypeScope {
  OnStimModelTypeForFunc get func {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFunc.stimFuncInstance().onStimModelType;
  }
}
