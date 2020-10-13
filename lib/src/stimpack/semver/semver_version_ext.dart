part of g3.stimpack.semver.init;

extension OnVersionSemverExtension on StimSemverVersion {
  /// Determines this is a latest version.
  bool get isLatest => this == stimpack.semver.version.latest;
}
