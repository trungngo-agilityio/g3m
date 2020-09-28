part of g3.stimpack.model;

class StimModelChoiceScope {
  StimModelChoice named(dynamic name) {
    return of(name: name, value: name);
  }

  StimModelChoice of({
    @meta.required dynamic name,
    dynamic value,
    Set<StimModelTag> tags,
  }) {
    name = StimName.of(name);
    value = StimName.of(value);

    return StimModelChoice()
      ..name = name
      ..value = value
      ..tags = tags;
  }
}

class StimModelChoice extends StimModelSymbol<StimModelChoice> {
  StimName value;

  StimModelChoice();

  StimModelChoice copyWith({
    dynamic name,
    dynamic value,
    Set<StimModelTag> tags,
  }) {
    return StimModelChoice()
      ..name = StimName.of(name ?? this.name)
      ..value = StimName.of(value ?? this.value)
      ..tags = tags ?? this.tags;
  }
}
