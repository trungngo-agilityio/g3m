part of g3.stimpack.semver.generated;



/// Defines the operator can be applied to a version range
class StimSemverVersionRangeOp extends StimModelSymbol<StimSemverVersionRangeOp> {
  StimSemverVersionRangeOp();


  /// Creates a new "versionRangeOp" of [StimSemverVersionRangeOp] type.
  StimSemverVersionRangeOp copyWith({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimSemverVersionRangeOp()
        ..name = StimName.of(name ?? this.name)
        ..tags = tags ?? this.tags;
  }
}


class StimSemverVersionRangeOpScope {
  StimSemverVersionRangeOp compatibleWith;

  StimSemverVersionRangeOp closeTo;

  StimSemverVersionRangeOp greaterThan;

  StimSemverVersionRangeOp greaterThanOrEqual;

  StimSemverVersionRangeOp lessThanOrEqual;

  StimSemverVersionRangeOp and;

  StimSemverVersionRangeOp or;

  StimSemverVersionRangeOp exact;


  /// Creates a new "versionRangeOp" of [StimSemverVersionRangeOp] type.
  StimSemverVersionRangeOp of({@required
  dynamic name, Set<StimModelTag> tags}) {
    return StimSemverVersionRangeOp()
        ..name = StimName.of(name)
        ..tags = tags ?? {};
  }
}
