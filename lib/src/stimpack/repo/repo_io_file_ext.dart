part of g3.stimpack.repo.init;

extension OnStimIoFileRepoExtension on StimIoFile {
  StimRepoRepository get repo => dir?.repo;

  StimRepoProject get project => dir?.project;
}
