part of g3.stimpack.semver.init;

extension OnVersionRangeSemverExtension on StimSemverVersionRange {
  /// Determines if this range is the special any version.
  bool get isAny => this == stimpack.semver.versionRange.any;
}
extension OnVersionRangeScopeSemverExtension on StimSemverVersionRangeScope {

  StimSemverVersionRange compatibleWith(StimSemverVersion version) {

  }
}
