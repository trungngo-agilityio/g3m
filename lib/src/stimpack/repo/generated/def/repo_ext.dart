part of g3.stimpack.repo.generated;



class OnStimModelTypeForRepo {
  StimModelType project;

  StimModelType repository;

  StimModelType dependency;

  StimModelType manifest;
}



extension OnStimModelTypeForRepoExtension on StimModelTypeScope {
  OnStimModelTypeForRepo get repo {
    /// Gets the type meta through stimpack public instance to trigger lazy init of the pack.
    return StimRepo.stimRepoInstance().onStimModelType;
  }
}
