part of g3.stimpack.repo.generated;


/// The only instance of the [StimRepo] pack.
StimRepo _repo;



class StimRepo extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "project" symbols, 
  /// typed of [StimRepoProject]."
  final StimRepoProjectScope project;

  /// Scope class for constructing all "repository" symbols, 
  /// typed of [StimRepoRepository]."
  final StimRepoRepositoryScope repository;

  /// Scope class for constructing all "dependency" symbols, 
  /// typed of [StimRepoDependency]."
  final StimRepoDependencyScope dependency;

  /// Scope class for constructing all "manifest" symbols, 
  /// typed of [StimRepoManifest]."
  final StimRepoManifestScope manifest;

  final OnStimModelTypeForRepo onStimModelType;

  StimRepo(StimModel model, StimIo io, StimSemver semver):
      project = StimRepoProjectScope(),
      repository = StimRepoRepositoryScope(),
      dependency = StimRepoDependencyScope(),
      manifest = StimRepoManifestScope(),
      onStimModelType = OnStimModelTypeForRepo(),
      super('repo');


  /// Provides global access to the "repo" pack. Only one instance of the pack 
  /// is created. During the creation, other packs that this pack depends on might 
  /// be created as well.
  static StimRepo stimRepoInstance() {
    if (_repo == null) {
      _repo = StimRepo(stimpack.model, stimpack.io, stimpack.semver);
      _repo._init();
    }
    return _repo;
  }

  void _init() {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'repo');
    final mt = onStimModelType;
    /// Builds type "project"
    mt.project = t.symbolOf(name: 'project', package: mp);

    /// Builds type "repository"
    mt.repository = t.symbolOf(name: 'repository', package: mp);

    /// Builds type "dependency"
    mt.dependency = t.symbolOf(name: 'dependency', package: mp);

    /// Builds type "manifest"
    mt.manifest = t.symbolOf(name: 'manifest', package: mp);

    /// Builds fields for type "project"
    mt.project.fields = {
      /// field "project"
      f.of(name: 'repositories', type: t.setOf(item: mt.repository)),

      /// field "project"
      f.of(name: 'path', type: t.io.dir)
    };

    /// Builds fields for type "repository"
    mt.repository.fields = {
      /// field "repository"
      f.of(name: 'project', type: mt.project)..required(),

      /// field "repository"
      f.of(name: 'parent repo', type: mt.repository),

      /// field "repository"
      f.of(name: 'child repos', type: t.setOf(item: mt.repository)),

      /// field "repository"
      f.of(name: 'path', type: t.io.dir),

      /// field "repository"
      f.of(name: 'dirs', type: t.setOf(item: t.io.dir)),

      /// field "repository"
      f.of(name: 'manifest', type: mt.manifest)
    };

    /// Builds fields for type "dependency"
    mt.dependency.fields = {
      /// field "dependency"
      f.of(name: 'version', type: t.semver.version)..required(),

      /// field "dependency"
      f.of(name: 'dependencies', type: t.setOf(item: mt.dependency)),

      /// field "dependency"
      f.of(name: 'dev dependencies', type: t.setOf(item: mt.dependency)),

      /// field "dependency"
      f.of(name: 'repository', type: mt.repository)
    };

    /// Builds fields for type "manifest"
    mt.manifest.fields = {
      /// field "manifest"
      f.of(name: 'version range', type: t.semver.versionRange)..required(),

      /// field "manifest"
      f.of(name: 'description', type: t.fromDart(String)),

      /// field "manifest"
      f.of(name: 'dependencies', type: t.setOf(item: mt.dependency)),

      /// field "manifest"
      f.of(name: 'dev dependencies', type: t.setOf(item: mt.dependency))
    };
  }
}
