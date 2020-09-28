part of g3.stimpack.model;

class StimModelRangeScope {
  StimModelRange of({
    @meta.required dynamic name,
    @meta.required num min,
    @meta.required num max,
    Set<StimModelTag> tags,
  }) =>
      StimModelRange()
        ..name = StimName.of(name)
        ..min = min
        ..max = max
        ..tags = tags;
}

class StimModelRange extends StimModelSymbol<StimModelRange> {
  num min;
  num max;

  StimModelRange();

  StimModelRange copyWith({
    dynamic name,
    num min,
    num max,
    Set<StimModelTag> tags,
  }) {
    return StimModelRange()
      ..name = StimName.of(name ?? this.name)
      ..min = min ?? this.min
      ..max = max ?? this.max
      ..tags = tags ?? this.tags;
  }
}
