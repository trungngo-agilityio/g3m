part of g3.stimpack.repo.init;

const _repoTagName = 'repo:repo';
const _projectTagName = 'repo:project';

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

  StimRepoProject get project =>
      firstValueOfTag<StimRepoProject>(_projectTagName) ?? parent?.project;

  set _project(StimRepoProject project) {
    if (project == null) {
      removeAllTags(_projectTagName);
    } else {
      setTag(name: _projectTagName, value: project);
    }
  }
}
