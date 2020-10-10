part of g3.stimpack.semver.generated;



/// Given a version number [major].[minor].[patch], increment the: 
/// - [major] version when you make incompatible API changes,
/// - [minor] version when you add functionality in a backwards compatible manner, 
/// - [patch] version when you make backwards compatible bug fixes.
/// 
/// Additional labels for pre-release and build metadata are available as 
/// extensions to the MAJOR.MINOR.PATCH format.
class StimSemverVersion extends StimModelSymbol<StimSemverVersion> {
  /// The major version.
  int major;

  /// The minor version.
  int minor;

  /// The patch version
  int patch;

  /// The additional labels.
  String label;

  StimSemverVersion();


  /// Creates a new "version" of [StimSemverVersion] type.
  StimSemverVersion copyWith({@required
  dynamic name, @required
  int major, @required
  int minor, int patch, String label, Set<StimModelTag> tags}) {
    return StimSemverVersion()
        ..name = StimName.of(name ?? this.name)
        ..major = major ?? this.major
        ..minor = minor ?? this.minor
        ..patch = patch ?? this.patch
        ..label = label ?? this.label
        ..tags = tags ?? this.tags;
  }
}


class StimSemverVersionScope {
  StimSemverVersion latest;


  /// Creates a new "version" of [StimSemverVersion] type.
  StimSemverVersion of({@required
  dynamic name, @required
  int major, @required
  int minor, int patch, String label, Set<StimModelTag> tags}) {
    return StimSemverVersion()
        ..name = StimName.of(name)
        ..major = major
        ..minor = minor
        ..patch = patch
        ..label = label
        ..tags = tags ?? {};
  }
}
