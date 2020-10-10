part of g3.stimpack.repo.generated;



class StimRepoRepository extends StimModelSymbol<StimRepoRepository> {
  /// The project this repository is in
  StimRepoProject project;

  /// The parent repository of this one.
  StimRepoRepository parentRepo;

  /// The child repositories of this one.
  Set<StimRepoRepository> childRepos;

  /// The relative path from project root to this repository.
  StimIoDir path;

  /// the set of sub directories
  Set<StimIoDir> dirs;

  /// The manifest defines this dependency
  StimRepoManifest manifest;

  StimRepoRepository();


  /// Creates a new "repository" of [StimRepoRepository] type.
  StimRepoRepository copyWith({@required
  dynamic name, @required
  StimRepoProject project, StimRepoRepository parentRepo, Set<StimRepoRepository> childRepos, StimIoDir path, Set<StimIoDir> dirs, StimRepoManifest manifest, Set<StimModelTag> tags}) {
    return StimRepoRepository()
        ..name = StimName.of(name ?? this.name)
        ..project = project ?? this.project
        ..parentRepo = parentRepo ?? this.parentRepo
        ..childRepos = childRepos ?? this.childRepos
        ..path = path ?? this.path
        ..dirs = dirs ?? this.dirs
        ..manifest = manifest ?? this.manifest
        ..tags = tags ?? this.tags;
  }
}


class StimRepoRepositoryScope {
  /// Creates a new "repository" of [StimRepoRepository] type.
  StimRepoRepository of({@required
  dynamic name, @required
  StimRepoProject project, StimRepoRepository parentRepo, Set<StimRepoRepository> childRepos, StimIoDir path, Set<StimIoDir> dirs, StimRepoManifest manifest, Set<StimModelTag> tags}) {
    return StimRepoRepository()
        ..name = StimName.of(name)
        ..project = project
        ..parentRepo = parentRepo
        ..childRepos = childRepos ?? {}
        ..path = path
        ..dirs = dirs ?? {}
        ..manifest = manifest
        ..tags = tags ?? {};
  }
}
