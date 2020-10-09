part of g3.stimpack.semver.generated;


/// The only instance of the [StimSemver] pack.
StimSemver _semver;



class StimSemver extends StimPack {
  StimModelPackage _metaPackage;

  /// Scope class for constructing all "version" symbols, 
  /// typed of [StimSemverVersion]."
  final StimSemverVersionScope version;

  /// Scope class for constructing all "versionRange" symbols, 
  /// typed of [StimSemverVersionRange]."
  final StimSemverVersionRangeScope versionRange;

  /// Scope class for constructing all "unaryVersionRange" symbols, 
  /// typed of [StimSemverUnaryVersionRange]."
  final StimSemverUnaryVersionRangeScope unaryVersionRange;

  /// Scope class for constructing all "versionRangeOp" symbols, 
  /// typed of [StimSemverVersionRangeOp]."
  final StimSemverVersionRangeOpScope versionRangeOp;

  final OnStimModelTypeForSemver onStimModelType;

  StimSemver(StimModel model):
      version = StimSemverVersionScope(),
      versionRange = StimSemverVersionRangeScope(),
      unaryVersionRange = StimSemverUnaryVersionRangeScope(),
      versionRangeOp = StimSemverVersionRangeOpScope(),
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

    /// Builds type "versionRange"
    mt.versionRange = t.symbolOf(name: 'versionRange', package: mp);

    /// Builds type "unaryVersionRange"
    mt.unaryVersionRange = t.symbolOf(name: 'unaryVersionRange', package: mp);

    /// Builds type "versionRangeOp"
    mt.versionRangeOp = t.symbolOf(name: 'versionRangeOp', package: mp);

    /// Builds fields for type "version"
    mt.version.fields = {
      /// field "version"
      f.of(name: 'major', type: t.fromDart(int))..required(),

      /// field "version"
      f.of(name: 'minor', type: t.fromDart(int))..required(),

      /// field "version"
      f.of(name: 'patch', type: t.fromDart(int)),

      /// field "version"
      f.of(name: 'label', type: t.fromDart(String))
    };

    /// Builds fields for type "unaryVersionRange"
    mt.unaryVersionRange.fields = {
      /// field "unaryVersionRange"
      f.of(name: 'op', type: mt.versionRangeOp)..required(),

      /// field "unaryVersionRange"
      f.of(name: 'start', type: mt.version)..required(),

      /// field "unaryVersionRange"
      f.of(name: 'end', type: mt.version)..required()
    };
  }
}
