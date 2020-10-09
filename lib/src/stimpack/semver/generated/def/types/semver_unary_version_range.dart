part of g3.stimpack.semver.generated;



/// Defines the range of versions
class StimSemverUnaryVersionRange extends StimModelSymbol<StimSemverUnaryVersionRange> {
  /// The operator applied to the range
  StimSemverVersionRangeOp op;

  /// The inclusive start version of the range.
  StimSemverVersion start;

  /// Exclusive end version. This value is not included in the range.
  StimSemverVersion end;

  StimSemverUnaryVersionRange();


  /// Creates a new "unaryVersionRange" of [StimSemverUnaryVersionRange] type.
  StimSemverUnaryVersionRange copyWith({@required
  dynamic name, @required
  StimSemverVersionRangeOp op, @required
  StimSemverVersion start, @required
  StimSemverVersion end, Set<StimModelTag> tags}) {
    return StimSemverUnaryVersionRange()
        ..name = StimName.of(name ?? this.name)
        ..op = op ?? this.op
        ..start = start ?? this.start
        ..end = end ?? this.end
        ..tags = tags ?? this.tags;
  }
}


class StimSemverUnaryVersionRangeScope {
  /// Creates a new "unaryVersionRange" of [StimSemverUnaryVersionRange] type.
  StimSemverUnaryVersionRange of({@required
  dynamic name, @required
  StimSemverVersionRangeOp op, @required
  StimSemverVersion start, @required
  StimSemverVersion end, Set<StimModelTag> tags}) {
    return StimSemverUnaryVersionRange()
        ..name = StimName.of(name)
        ..op = op
        ..start = start
        ..end = end
        ..tags = tags ?? {};
  }
}
