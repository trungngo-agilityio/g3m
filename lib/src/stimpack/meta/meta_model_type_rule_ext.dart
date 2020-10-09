part of g3.stimpack.meta;



class OnStimModelTypeRuleForMeta {
  StimModelTypeRule interface;
}



extension OnStimModelTypeForFakerExtension on StimModelTypeScope {
  OnStimModelTypeRuleForMeta get meta {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimMeta.stimMetaInstance().onStimModelTypeRule;
  }
}
