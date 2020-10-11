part of g3.stimpack.repo.init;

const _modelPackageTagName = 'repo:repo';

extension OnStimModelPackageRepoExtension on StimModelPackage {
  StimRepoRepository get repo =>
      firstValueOfTag<StimRepoRepository>(_modelPackageTagName) ?? parent?.repo;

  set repo(StimRepoRepository repo) {
    if (repo == null) {
      removeAllTags(_modelPackageTagName);
    } else {
      setTag(name: _modelPackageTagName, value: repo);
    }
  }

  StimRepoProject get project => repo?.project;
}
