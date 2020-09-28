part of g3.stimpack.model;

class StimModelTypeRuleScope {
  StimModelTypeRule of({
    @meta.required dynamic name,
    Set<StimModelChoice> choices,
    Set<StimModelRange> ranges,
    Set<StimModelTag> tags,
  }) {
    return StimModelTypeRule()
      ..name = StimName.of(name)
      ..choices = choices
      ..ranges = ranges
      ..tags = tags;
  }
}

class StimModelTypeRule extends StimModelSymbol<StimModelTypeRule> {
  /// The set of choices, applied to this type
  Set<StimModelChoice> choices;

  /// The set of data ranges, applied to this type
  Set<StimModelRange> ranges;

  StimModelTypeRule();

  StimModelTypeRule copyWith({
    dynamic name,
    Set<StimModelChoice> choices,
    Set<StimModelRange> ranges,
    Set<StimModelTag> tags,
  }) {
    return StimModelTypeRule()
      ..name = StimName.of(name ?? this.name)
      ..choices = choices ?? this.choices
      ..ranges = ranges ?? this.ranges
      ..tags = tags ?? this.tags;
  }
}
