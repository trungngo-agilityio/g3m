part of g3.stimpack.func.generated;



class StimFuncOnStimModelType {
  StimModelType map;

  StimModelType fieldMap;

  StimModelType filter;
}



extension StimFuncOnStimModelTypeExtension on StimModelTypeScope {
  StimFuncOnStimModelType get func {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFunc.stimFuncInstance().onStimModelType;
  }
}
