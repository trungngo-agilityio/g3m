part of g3.stimpack.semver.generated;



class OnStimModelTypeForSemver {
  StimModelType version;
}



extension OnStimModelTypeForSemverExtension on StimModelTypeScope {
  OnStimModelTypeForSemver get semver {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimSemver.stimSemverInstance().onStimModelType;
  }
}
