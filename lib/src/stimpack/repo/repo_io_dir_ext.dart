part of g3.stimpack.repo.init;

const _repoTagName = 'repo:repo';

extension OnStimIoDirRepoExtension on StimIoDir {
  StimRepoRepository get repo =>
      firstValueOfTag<StimRepoRepository>(_repoTagName) ?? parent?.repo;

  set _repo(StimRepoRepository repo) {
    if (repo == null) {
      removeAllTags(_repoTagName);
    } else {
      setTag(name: _repoTagName, value: repo);
    }
  }

  StimRepoProject get project => repo?.project;
}
