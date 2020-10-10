part of g3.stimpack.nx.generated;


/// The only instance of the [StimNx] pack.
StimNx _nx;



class StimNx extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "workspace" symbols, 
  /// typed of [StimNxWorkspace]."
  final StimNxWorkspaceScope workspace;

  /// Scope class for constructing all "lib" symbols, 
  /// typed of [StimNxLib]."
  final StimNxLibScope lib;

  /// Scope class for constructing all "app" symbols, 
  /// typed of [StimNxApp]."
  final StimNxAppScope app;

  final OnStimModelTypeForNx onStimModelType;

  StimNx(StimModel model, StimRepo repo, StimIo io, StimSemver semver):
      workspace = StimNxWorkspaceScope(),
      lib = StimNxLibScope(),
      app = StimNxAppScope(),
      onStimModelType = OnStimModelTypeForNx(),
      super('nx');


  /// Provides global access to the "nx" pack. Only one instance of the pack 
  /// is created. During the creation, other packs that this pack depends on might 
  /// be created as well.
  static StimNx stimNxInstance() {
    if (_nx == null) {
      _nx = StimNx(stimpack.model, stimpack.repo, stimpack.io, stimpack.semver);
      _nx._init();
    }
    return _nx;
  }

  void _init() {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'nx');
    final mt = onStimModelType;
    /// Builds type "workspace"
    mt.workspace = t.symbolOf(name: 'workspace', package: mp);

    /// Builds type "lib"
    mt.lib = t.symbolOf(name: 'lib', package: mp);

    /// Builds type "app"
    mt.app = t.symbolOf(name: 'app', package: mp);

    /// Builds fields for type "workspace"
    mt.workspace.fields = {
      /// field "workspace"
      f.of(name: 'project', type: t.repo.project)..required(),

      /// field "workspace"
      f.of(name: 'libsDir', type: t.io.dir)..required(),

      /// field "workspace"
      f.of(name: 'appsDir', type: t.io.dir)..required(),

      /// field "workspace"
      f.of(name: 'libs', type: t.setOf(item: mt.lib))..required(),

      /// field "workspace"
      f.of(name: 'apps', type: t.setOf(item: mt.app))..required()
    };

    /// Builds fields for type "lib"
    mt.lib.fields = {
      /// field "lib"
      f.of(name: 'workspace', type: mt.workspace)..required(),

      /// field "lib"
      f.of(name: 'repo', type: t.repo.repository)
    };

    /// Builds fields for type "app"
    mt.app.fields = {
      /// field "app"
      f.of(name: 'workspace', type: mt.workspace)..required(),

      /// field "app"
      f.of(name: 'repo', type: t.repo.repository)..required()
    };
  }
}
