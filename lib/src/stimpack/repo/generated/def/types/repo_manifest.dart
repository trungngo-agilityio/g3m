part of g3.stimpack.repo.generated;



class StimRepoManifest extends StimModelSymbol<StimRepoManifest> {
  /// The dependency version range
  StimSemverVersionRange versionRange;

  /// Additional description about the library
  String description;

  /// The dependencies of this one, at run time
  Set<StimRepoDependency> dependencies;

  /// The dev dependencies of this one, at compile time
  Set<StimRepoDependency> devDependencies;

  StimRepoManifest();


  /// Creates a new "manifest" of [StimRepoManifest] type.
  StimRepoManifest copyWith({@required
  dynamic name, @required
  StimSemverVersionRange versionRange, String description, Set<StimRepoDependency> dependencies, Set<StimRepoDependency> devDependencies, Set<StimModelTag> tags}) {
    return StimRepoManifest()
        ..name = StimName.of(name ?? this.name)
        ..versionRange = versionRange ?? this.versionRange
        ..description = description ?? this.description
        ..dependencies = dependencies ?? this.dependencies
        ..devDependencies = devDependencies ?? this.devDependencies
        ..tags = tags ?? this.tags;
  }
}


class StimRepoManifestScope {
  /// Creates a new "manifest" of [StimRepoManifest] type.
  StimRepoManifest of({@required
  dynamic name, @required
  StimSemverVersionRange versionRange, String description, Set<StimRepoDependency> dependencies, Set<StimRepoDependency> devDependencies, Set<StimModelTag> tags}) {
    return StimRepoManifest()
        ..name = StimName.of(name)
        ..versionRange = versionRange
        ..description = description
        ..dependencies = dependencies ?? {}
        ..devDependencies = devDependencies ?? {}
        ..tags = tags ?? {};
  }
}
