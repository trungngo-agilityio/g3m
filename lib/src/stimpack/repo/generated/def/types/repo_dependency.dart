part of g3.stimpack.repo.generated;



class StimRepoDependency extends StimModelSymbol<StimRepoDependency> {
  /// The dependency version range
  StimSemverVersionRange versionRange;

  /// The location where to download this dependency.
  Uri uri;

  /// The dependencies of this one, at run time
  Set<StimRepoDependency> dependencies;

  /// The dev dependencies of this one, at compile time
  Set<StimRepoDependency> devDependencies;

  /// The optional repository defined this dependency.
  StimRepoRepository repository;

  StimRepoDependency();


  /// Creates a new "dependency" of [StimRepoDependency] type.
  StimRepoDependency copyWith({@required
  dynamic name, @required
  StimSemverVersionRange versionRange, Uri uri, Set<StimRepoDependency> dependencies, Set<StimRepoDependency> devDependencies, StimRepoRepository repository, Set<StimModelTag> tags}) {
    return StimRepoDependency()
        ..name = StimName.of(name ?? this.name)
        ..versionRange = versionRange ?? this.versionRange
        ..uri = uri ?? this.uri
        ..dependencies = dependencies ?? this.dependencies
        ..devDependencies = devDependencies ?? this.devDependencies
        ..repository = repository ?? this.repository
        ..tags = tags ?? this.tags;
  }
}


class StimRepoDependencyScope {
  /// Creates a new "dependency" of [StimRepoDependency] type.
  StimRepoDependency of({@required
  dynamic name, @required
  StimSemverVersionRange versionRange, Uri uri, Set<StimRepoDependency> dependencies, Set<StimRepoDependency> devDependencies, StimRepoRepository repository, Set<StimModelTag> tags}) {
    return StimRepoDependency()
        ..name = StimName.of(name)
        ..versionRange = versionRange
        ..uri = uri
        ..dependencies = dependencies ?? {}
        ..devDependencies = devDependencies ?? {}
        ..repository = repository
        ..tags = tags ?? {};
  }
}
