part of g3.stimpack.repo.generated;



class StimRepoProject extends StimModelSymbol<StimRepoProject> {
  /// The set of code repositories defined in the project.
  Set<StimRepoRepository> repositories;

  /// The root directory of the project
  StimIoDir path;

  StimRepoProject();


  /// Creates a new "project" of [StimRepoProject] type.
  StimRepoProject copyWith({@required
  dynamic name, Set<StimRepoRepository> repositories, StimIoDir path, Set<StimModelTag> tags}) {
    return StimRepoProject()
        ..name = StimName.of(name ?? this.name)
        ..repositories = repositories ?? this.repositories
        ..path = path ?? this.path
        ..tags = tags ?? this.tags;
  }
}


class StimRepoProjectScope {
  /// Creates a new "project" of [StimRepoProject] type.
  StimRepoProject of({@required
  dynamic name, Set<StimRepoRepository> repositories, StimIoDir path, Set<StimModelTag> tags}) {
    return StimRepoProject()
        ..name = StimName.of(name)
        ..repositories = repositories ?? {}
        ..path = path
        ..tags = tags ?? {};
  }
}
