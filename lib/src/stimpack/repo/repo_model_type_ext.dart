part of g3.stimpack.repo.init;

extension OnStimModelTypeRepoExtension on StimModelType {
  StimRepoRepository get repo => package?.repo;

  StimRepoProject get project => repo?.project;
}
