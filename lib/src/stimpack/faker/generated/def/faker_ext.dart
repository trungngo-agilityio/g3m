part of g3.stimpack.faker.generated;



class OnStimModelTypeForFaker {
  StimModelType type;
}



extension OnStimModelTypeForFakerExtension on StimModelTypeScope {
  OnStimModelTypeForFaker get faker {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimFaker.stimFakerInstance().onStimModelType;
  }
}
