part of g3.stimpack.model;

class StimModelPatternScope {
  StimModelPattern id,
      uuidV4,
      slug,
      ipv4,
      ipv6,
  // Either ipv4 or ipv6
      ip,
      url,
      email,
      username,
      password,
      phone,
      zipCode;

  // Data type pattern, these might be needed in the case
  // that the field is string type, but must be formatted.
  StimModelPattern string,
      num,
      int,
      double,
      bool,
      duration,
      uri,
      date,
      dateTime,
      time;

  StimModelPattern of({
    @meta.required dynamic name,
    Set<StimModelTag> tags,
  }) =>
      StimModelPattern()
        ..name = StimName.of(name)
        ..tags = tags;
}

class StimModelPattern extends StimModelSymbol<StimModelPattern> {
  StimModelPattern();

  StimModelPattern copyWith({
    dynamic name,
    Set<StimModelTag> tags,
  }) {
    return StimModelPattern()
      ..name = StimName.of(name ?? this.name)
      ..tags = tags ?? this.tags;
  }
}
