part of g3.stimpack.semver.generated;



/// Defines the range of versions
class StimSemverVersionRange extends StimModelSymbol<StimSemverVersionRange> {
  StimSemverVersionRange();


  /// Creates a new "versionRange" of [StimSemverVersionRange] type.
  StimSemverVersionRange copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimSemverVersionRange()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimSemverVersionRangeScope {
  StimSemverVersionRange any;


  /// Creates a new "versionRange" of [StimSemverVersionRange] type.
  StimSemverVersionRange of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimSemverVersionRange()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
