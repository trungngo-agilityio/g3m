part of g3.stimpack.semver.generated;


/// The only instance of the [StimSemver] pack.
StimSemver _semver;



class StimSemver extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "version" symbols, 
  /// typed of [StimSemverVersion]."
  final StimSemverVersionScope version;

  final OnStimModelTypeForSemver onStimModelType;

  StimSemver(StimModel model):
      version = StimSemverVersionScope(),
      onStimModelType = OnStimModelTypeForSemver(),
      super('semver');


  /// Provides global access to the "semver" pack. Only one instance of the pack 
  /// is created. During the creation, other packs that this pack depends on might 
  /// be created as well.
  static StimSemver stimSemverInstance() {
    if (_semver == null) {
      _semver = StimSemver(stimpack.model);
      _semver._init();
    }
    return _semver;
  }

  void _init() {
    /// Builds the meta definition that defines the structure of this pack.
    _buildMeta();
  }

  void _buildMeta() {
    final m = stimpack.model, f = m.field, t = m.type;
    final mp = _metaPackage = m.package.of(name: 'semver');
    final mt = onStimModelType;
    /// Builds type "version"
    mt.version = t.symbolOf(name: 'version', package: mp);

    /// Builds fields for type "version"
    mt.version.fields = {
      /// field "version"
      f.of(name: 'major', type: t.fromDart(String))..required(),

      /// field "version"
      f.of(name: 'minor', type: t.fromDart(String))..required(),

      /// field "version"
      f.of(name: 'patch', type: t.fromDart(String)),

      /// field "version"
      f.of(name: 'label', type: t.fromDart(String))
    };
  }
}
